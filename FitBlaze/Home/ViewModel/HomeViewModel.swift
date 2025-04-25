//
//  HomeViewModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 23/04/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories:Int = 123
    @Published var exercise:Int = 52
    @Published var stand:Int = 8
    @Published var activities = [Activity]()
    @Published var workouts =  [
        Workout(id: UUID(), image: "figure.run", tintColor: .green, title: "Running", duration: "23 mins", date: "Aug 3", calories: "371 kcal"),
        Workout(id: UUID(), image: "figure.walk", tintColor: .blue, title: "Walking", duration: "45 mins", date: "Aug 4", calories: "220 kcal"),
        Workout(id: UUID(), image: "figure.strengthtraining.traditional", tintColor: .red, title: "Strength Training", duration: "35 mins", date: "Aug 5", calories: "410 kcal"),
        Workout(id: UUID(), image: "figure.yoga", tintColor: .purple, title: "Yoga", duration: "50 mins", date: "Aug 6", calories: "180 kcal"),
        Workout(id: UUID(), image: "figure.outdoor.cycle", tintColor: .orange, title: "Cycling", duration: "60 mins", date: "Aug 7", calories: "520 kcal")
    ]
    
    init(){
        
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchCalories()
                fetchStandTime()
                fetchExersiseTime()
                fetchTodaySteps()
                fetchCurrentWeekWorkoutStat()
                fetchRecentWorkouts()
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func fetchCalories() {
        
        healthManager.fetchTodaysCaloriesBurned { result in
            
            switch result {
                
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity(id: UUID(), title: "Calories burned", subtitle: "today", image: "flame", tintColor: .red, amount: calories.formattedString())
                    self.activities.append(activity)
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
            
        }
        
    }
    
    
    func fetchStandTime(){
        
        healthManager.fetchTodaysStandHours { result in
            
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
    func fetchExersiseTime() {
        
        healthManager.fetchTodaysExerciseTime { result in
            
            switch result {
                
            case .success(let time):
                DispatchQueue.main.async {
                    self.exercise = Int(time)
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
            
        }
        
    }
    
    // MARK: - Fitness Activity
    
    func fetchTodaySteps() {
        
        healthManager.fetchTodaySteps { result in
            
            switch result {
                
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
            
        }
        
    }
    
    func fetchCurrentWeekWorkoutStat() {
        
        healthManager.fetchCurrentWeekWorkoutStat { result in
            
            switch result {
                
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
    
// MARK: - Recent Workouts
    
    func fetchRecentWorkouts() {
        healthManager.fetchWorkoutsForMonth(month: Date()) { result in
            
            switch result {
                case .success(let workouts):
                DispatchQueue.main.async {
                    self.workouts = Array(workouts.prefix(4))
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
