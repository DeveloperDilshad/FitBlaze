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
    
    //    var mockActivity: [Activity] = [
    //        Activity(id: 0, title: "Today Steps", subtitle: "Goal 100 step", image: "figure.walk", tintColor: .green, amount: "6,121"),
    //        Activity(id: 1, title: "Today Run", subtitle: "Goal 100 step", image: "figure.run", tintColor: .red, amount: "8,921"),
    //        Activity(id: 2, title: "Today Training", subtitle: "Goal 100 step", image: "figure.highintensity.intervaltraining", tintColor: .blue, amount: "1721"),
    //        Activity(id: 3, title: "Today Workout", subtitle: "Goal 100 step", image: "figure.run.treadmill", tintColor: .purple, amount: "10,345"),
    //
    //    ]
    
    var mockWorkout: [Workout] = [
        Workout(id: 0, image: "figure.run", tintColor: .green, title: "Running", duration: "23 mins", date: "Aug 3", calories: "371 kcal"),
        Workout(id: 1, image: "figure.walk", tintColor: .blue, title: "Walking", duration: "45 mins", date: "Aug 4", calories: "220 kcal"),
        Workout(id: 2, image: "figure.strengthtraining.traditional", tintColor: .red, title: "Strength Training", duration: "35 mins", date: "Aug 5", calories: "410 kcal"),
        Workout(id: 3, image: "figure.yoga", tintColor: .purple, title: "Yoga", duration: "50 mins", date: "Aug 6", calories: "180 kcal"),
        Workout(id: 4, image: "figure.outdoor.cycle", tintColor: .orange, title: "Cycling", duration: "60 mins", date: "Aug 7", calories: "520 kcal")
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
    
    //MARK:- Fitness Activity
    
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
}
