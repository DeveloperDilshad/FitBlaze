//
//  HKWorkoutActivityType+Ext.swift
//  FitBlaze
//
//  Created by Dilshad P on 24/04/25.
//

import HealthKit
import SwiftUI

extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    
    
    var title: String {
            switch self {
            case .americanFootball:             return "American Football"
            case .archery:                      return "Archery"
            case .australianFootball:           return "Australian Football"
            case .badminton:                    return "Badminton"
            case .baseball:                     return "Baseball"
            case .basketball:                   return "Basketball"
            case .bowling:                      return "Bowling"
            case .boxing:                       return "Boxing"
            case .climbing:                     return "Climbing"
            case .crossTraining:                return "Cross Training"
            case .curling:                      return "Curling"
            case .cycling:                      return "Cycling"
            case .dance:                        return "Dance"
            case .danceInspiredTraining:        return "Dance Inspired Training"
            case .elliptical:                   return "Elliptical"
            case .equestrianSports:             return "Equestrian Sports"
            case .fencing:                      return "Fencing"
            case .fishing:                      return "Fishing"
            case .functionalStrengthTraining:   return "Functional Strength Training"
            case .golf:                         return "Golf"
            case .gymnastics:                   return "Gymnastics"
            case .handball:                     return "Handball"
            case .hiking:                       return "Hiking"
            case .hockey:                       return "Hockey"
            case .hunting:                      return "Hunting"
            case .lacrosse:                     return "Lacrosse"
            case .martialArts:                  return "Martial Arts"
            case .mindAndBody:                  return "Mind and Body"
            case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
            case .paddleSports:                 return "Paddle Sports"
            case .play:                         return "Play"
            case .preparationAndRecovery:       return "Preparation and Recovery"
            case .racquetball:                  return "Racquetball"
            case .rowing:                       return "Rowing"
            case .rugby:                        return "Rugby"
            case .running:                      return "Running"
            case .sailing:                      return "Sailing"
            case .skatingSports:                return "Skating Sports"
            case .snowSports:                   return "Snow Sports"
            case .soccer:                       return "Soccer"
            case .softball:                     return "Softball"
            case .squash:                       return "Squash"
            case .stairClimbing:                return "Stair Climbing"
            case .surfingSports:                return "Surfing Sports"
            case .swimming:                     return "Swimming"
            case .tableTennis:                  return "Table Tennis"
            case .tennis:                       return "Tennis"
            case .trackAndField:                return "Track and Field"
            case .traditionalStrengthTraining:  return "Traditional Strength Training"
            case .volleyball:                   return "Volleyball"
            case .walking:                      return "Walking"
            case .waterFitness:                 return "Water Fitness"
            case .waterPolo:                    return "Water Polo"
            case .waterSports:                  return "Water Sports"
            case .wrestling:                    return "Wrestling"
            case .yoga:                         return "Yoga"
            case .barre:                        return "Barre"
            case .coreTraining:                 return "Core Training"
            case .crossCountrySkiing:           return "Cross Country Skiing"
            case .downhillSkiing:               return "Downhill Skiing"
            case .flexibility:                  return "Flexibility"
            case .highIntensityIntervalTraining:return "High Intensity Interval Training"
            case .jumpRope:                     return "Jump Rope"
            case .kickboxing:                   return "Kickboxing"
            case .pilates:                      return "Pilates"
            case .snowboarding:                 return "Snowboarding"
            case .stairs:                       return "Stairs"
            case .stepTraining:                 return "Step Training"
            case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
            case .wheelchairRunPace:            return "Wheelchair Run Pace"
            case .taiChi:                       return "Tai Chi"
            case .mixedCardio:                  return "Mixed Cardio"
            case .handCycling:                  return "Hand Cycling"
            case .discSports:                   return "Disc Sports"
            case .fitnessGaming:                return "Fitness Gaming"
            default:                            return "Other"
            }
        }

    
    var image: String {
            switch self {
            case .americanFootball:             return "football.fill"
            case .archery:                      return "target"
            case .australianFootball:           return "sportscourt"
            case .badminton:                    return "sportscourt"
            case .baseball:                     return "sportscourt"
            case .basketball:                   return "basketball.fill"
            case .bowling:                      return "sportscourt"
            case .boxing:                       return "figure.boxing"
            case .climbing:                     return "figure.climbing"
            case .crossTraining:                return "figure.cross.training"
            case .curling:                      return "sportscourt"
            case .cycling:                      return "bicycle"
            case .dance:                        return "figure.dance"
            case .danceInspiredTraining:        return "figure.dance"
            case .elliptical:                   return "figure.elliptical"
            case .equestrianSports:             return "figure.equestrian.sports"
            case .fencing:                      return "sportscourt"
            case .fishing:                      return "figure.fishing"
            case .functionalStrengthTraining:   return "dumbbell.fill"
            case .golf:                         return "sportscourt"
            case .gymnastics:                   return "figure.gymnastics"
            case .handball:                     return "sportscourt"
            case .hiking:                       return "figure.hiking"
            case .hockey:                       return "sportscourt"
            case .hunting:                      return "scope"
            case .lacrosse:                     return "sportscourt"
            case .martialArts:                  return "figure.martial.arts"
            case .mindAndBody:                  return "figure.mind.and.body"
            case .mixedMetabolicCardioTraining: return "flame.fill"
            case .paddleSports:                 return "sportscourt"
            case .play:                         return "play.circle.fill"
            case .preparationAndRecovery:       return "figure.cooldown"
            case .racquetball:                  return "sportscourt"
            case .rowing:                       return "figure.rower"
            case .rugby:                        return "sportscourt"
            case .running:                      return "figure.run"
            case .sailing:                      return "sailboat.fill"
            case .skatingSports:                return "figure.skating"
            case .snowSports:                   return "snowflake"
            case .soccer:                       return "soccerball"
            case .softball:                     return "sportscourt"
            case .squash:                       return "sportscourt"
            case .stairClimbing:                return "stairs"
            case .surfingSports:                return "figure.surfing"
            case .swimming:                     return "figure.pool.swim"
            case .tableTennis:                  return "sportscourt"
            case .tennis:                       return "tennis.racket"
            case .trackAndField:                return "sportscourt"
            case .traditionalStrengthTraining:  return "dumbbell.fill"
            case .volleyball:                   return "sportscourt"
            case .walking:                      return "figure.walk"
            case .waterFitness:                 return "drop.fill"
            case .waterPolo:                    return "sportscourt"
            case .waterSports:                  return "figure.water.fitness"
            case .wrestling:                    return "figure.wrestling"
            case .yoga:                         return "figure.yoga"

            case .barre:                        return "figure.barre"
            case .coreTraining:                 return "square.stack.3d.down.right.fill"
            case .crossCountrySkiing:           return "figure.skiing.crosscountry"
            case .downhillSkiing:               return "figure.skiing.downhill"
            case .flexibility:                  return "figure.cooldown"
            case .highIntensityIntervalTraining:return "bolt.fill"
            case .jumpRope:                     return "figure.jump.rope"
            case .kickboxing:                   return "figure.kickboxing"
            case .pilates:                      return "figure.pilates"
            case .snowboarding:                 return "figure.snowboarding"
            case .stairs:                       return "stairs"
            case .stepTraining:                 return "figure.step.training"
            case .wheelchairWalkPace:           return "figure.roll"
            case .wheelchairRunPace:            return "figure.roll.running"
            case .taiChi:                       return "figure.cooldown"
            case .mixedCardio:                  return "heart.fill"
            case .handCycling:                  return "figure.hand.cycling"
            case .discSports:                   return "sportscourt"
            case .fitnessGaming:                return "gamecontroller.fill"
            default:                            return "figure.workout"
            }
        }
    
    
    var color: Color {
            switch self {
            case .running, .walking: return .green
            case .cycling: return .blue
            case .swimming: return .teal
            case .yoga, .mindAndBody, .taiChi, .pilates, .flexibility: return .purple
            case .functionalStrengthTraining, .traditionalStrengthTraining: return .orange
            case .highIntensityIntervalTraining: return .red
            case .hiking: return .brown
            case .boxing, .martialArts, .kickboxing, .wrestling: return .pink
            case .dance, .danceInspiredTraining, .barre: return .mint
            case .rowing: return .indigo
            case .elliptical, .coreTraining, .stepTraining, .stairs: return .gray
            case .snowSports, .snowboarding, .downhillSkiing, .crossCountrySkiing: return .cyan
            case .fishing, .hunting, .equestrianSports, .sailing: return .blue.opacity(0.6)
            case .soccer, .basketball, .volleyball, .baseball, .softball, .rugby: return .yellow
            case .americanFootball, .australianFootball, .lacrosse, .handball, .hockey: return .red.opacity(0.7)
            case .fitnessGaming: return .cyan
            default: return .gray
            }
        }
}
