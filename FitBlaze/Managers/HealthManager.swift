//
//  HealthManager.swift
//  FitBlaze
//
//  Created by Dilshad P on 23/04/25.
//

import Foundation
import HealthKit

extension Date {
   
    static var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        return calendar.date(from: components) ?? Date()
    }
    
}

extension Double {
    func formattedString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}

class HealthManager {
    
   static let shared = HealthManager()
    let healthStore = HKHealthStore()
    
    private init(){
        
        Task {
            do {
                
                try await requestHealthKitAccess()
                
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws {
        
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKQuantityType(.appleStandTime)
        let steps = HKQuantityType(.stepCount)
        let workouts = HKSampleType.workoutType()
        let healthTypes: Set = [calories, exercise, stand, steps, workouts]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodaysCaloriesBurned(completion:@escaping(Result<Double,Error>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) {_, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        
        healthStore.execute(query)
    }
    
    
    func fetchTodaysExerciseTime(completion:@escaping(Result<Double,Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) {_, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            let exerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(exerciseTime))
        }
        
        healthStore.execute(query)
    }
    
    
    func fetchTodaysStandHours(completion:@escaping(Result<Int,Error>) -> Void) {
        let stand = HKQuantityType(.appleStandTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {_, results, error in
         
            guard let samples = results as? [HKCategorySample], error == nil else {
                completion(.failure(NSError()))
                return
            }
            let standCount = samples.filter({ $0.value == 0}).count
            completion(.success(standCount))
        }
        
        healthStore.execute(query)
    }
    
    // MARK :- Fitness Activity
    
    func fetchTodaySteps(completion:@escaping(Result<Activity,Error>) -> Void) {
        
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) {_, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let step = quantity.doubleValue(for: .count())
            let activity = Activity(id: UUID(), title: "Today Steps", subtitle: "Goal: 800", image: "figure.walk", tintColor: .green, amount: step.formattedString())
            completion(.success(activity))
        }
        
        healthStore.execute(query)
    }
    
    
    func fetchCurrentWeekWorkoutStat(completion:@escaping(Result<[Activity],Error>) -> Void) {
        let workouts = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {[weak self]_, results, error in
         
            guard let workouts = results as? [HKWorkout],let self = self, error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            var runningCount: Int = 0
            var strengthCount: Int = 0
            var soccerCount: Int = 0
            var basketballCount: Int = 0
            var stairsCount: Int = 0
            var kickboxingCount: Int = 0
            
            for workout in workouts {
                let duration = Int(workout.duration / 60)
                if workout.workoutActivityType == .running {
                    runningCount += duration
                }else if workout.workoutActivityType == .traditionalStrengthTraining {
                    strengthCount += duration
                }else if workout.workoutActivityType == .soccer {
                    soccerCount += duration
                }else if workout.workoutActivityType == .basketball {
                    basketballCount += duration
                }else if workout.workoutActivityType == .stairClimbing {
                    stairsCount += duration
                }else if workout.workoutActivityType == .kickboxing {
                    kickboxingCount += duration
                }
                
            }
            
            completion(.success(generateActivitiesFromDuration(running: runningCount, strength: strengthCount, soccer: soccerCount, basketball: basketballCount, stairs: stairsCount, kickboxing: kickboxingCount)))
        }
        
        healthStore.execute(query)
    }
    
    func generateActivitiesFromDuration(running: Int, strength: Int, soccer: Int, basketball: Int, stairs: Int, kickboxing: Int) -> [Activity] {
        
        let activities: [Activity] = [
             
            Activity(id: UUID(), title: "Running", subtitle: "Goal: 800", image: "figure.run", tintColor: .green, amount: "\(running)"),
            Activity(id: UUID(), title: "Strength Training", subtitle: "Goal: 800", image: "dumbbell", tintColor: .green, amount: "\(strength)"),
            Activity(id: UUID(), title: "Soccer", subtitle: "Goal: 800", image: "figure.soccer", tintColor: .green, amount:"\(soccer)"),
            Activity(id: UUID(), title: "Basket Ball", subtitle: "Goal: 800", image: "figure.basketball", tintColor: .green, amount: "\(basketball)"),
            Activity(id: UUID(), title: "Stairstepper", subtitle: "Goal: 800", image: "figure.stairs", tintColor: .green, amount: "\(stairs)"),
            Activity(id: UUID(), title: "Kick Boxing", subtitle: "Goal: 800", image: "figure.kickboxing", tintColor: .green, amount: "\(kickboxing)")
            
        ]
        
        return activities
    }
    
    }

