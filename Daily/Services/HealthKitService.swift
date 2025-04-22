//
//  HealthKitService.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

import SwiftUI
import HealthKit

enum RunQueryDuration {
    case Month
    case Year
}

class HealthKitService {
    
    static let shared = HealthKitService()
    let healthStore = HKHealthStore()
    
    private init() {}
    
    // MARK: Get this year's runs
    func getCurrentYearsWorkouts(completion: @escaping (Dictionary<String, [HKWorkout]>) -> Void) {
        let calendar = Calendar.current
        let today = Date.now
        let currentYear = calendar.component(.year, from: today)
        
        // Get first day of the year
        var firstDayComponents = DateComponents()
        firstDayComponents.year = currentYear
        firstDayComponents.month = 1
        firstDayComponents.day = 1

        let firstDayOfYear = calendar.date(from: firstDayComponents)!
        
        // Get the last day of the current year
        var lastDayComponents = DateComponents()
        lastDayComponents.year = currentYear
        lastDayComponents.month = 12
        lastDayComponents.day = 31
        
        let lastDayOfYear = calendar.date(from: lastDayComponents)!
        
        // Create predicate for this month
        let predicate = HKQuery.predicateForSamples(withStart: firstDayOfYear, end: lastDayOfYear, options: .strictStartDate)

        // Query workouts
        let query = HKSampleQuery(
            sampleType: HKObjectType.workoutType(),
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]
        ) { _, samples, error in
            guard let runs = samples as? [HKWorkout], error == nil else {
                print("Error fetching workouts: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            var runDictionary: Dictionary<String, [HKWorkout]> = [:]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            for run in runs {
                if run.workoutActivityType == .running && run.sourceRevision.source.name == "COROS" {
                    if let existingDay = runDictionary[formatter.string(from: run.startDate)] {
                        var newRuns = existingDay
                        newRuns.append(run)
                        
                        runDictionary[formatter.string(from: run.startDate)] = newRuns
                    } else {
                        runDictionary[formatter.string(from: run.startDate)] = [run]
                    }
                }
            }

            completion(runDictionary)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get this month's runs
    func getCurrentMonthsWorkouts(completion: @escaping (Dictionary<String, [HKWorkout]>) -> Void) {
        let calendar = Calendar.current
        let today = Date.now

        // Get the first day of the current month
        let firstDayOfCurrentMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
        
        // Get the last day of the current month
        let range = calendar.range(of: .day, in: .month, for: today)!
        let lastDayOfCurrentMonth = calendar.date(bySetting: .day, value: range.upperBound - 1, of: today)!
        
        // Create predicate for this month
        let predicate = HKQuery.predicateForSamples(withStart: firstDayOfCurrentMonth, end: lastDayOfCurrentMonth, options: .strictStartDate)

        // Query workouts
        let query = HKSampleQuery(
            sampleType: HKObjectType.workoutType(),
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]
        ) { _, samples, error in
            guard let runs = samples as? [HKWorkout], error == nil else {
                print("Error fetching workouts: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            var runDictionary: Dictionary<String, [HKWorkout]> = [:]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            for run in runs {
                if run.workoutActivityType == .running && run.sourceRevision.source.name == "COROS" {
                    if let existingDay = runDictionary[formatter.string(from: run.startDate)] {
                        var newRuns = existingDay
                        newRuns.append(run)
                        
                        runDictionary[formatter.string(from: run.startDate)] = newRuns
                    } else {
                        runDictionary[formatter.string(from: run.startDate)] = [run]
                    }
                }
            }

            completion(runDictionary)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get today's runs
    func getTodaysRuns(day: Date, completion: @escaping ([HKWorkout]) -> Void) {
        let calendar = Calendar.current
        let today = Date.now

        // Get the first day of the current month
        let firstDayOfCurrentMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
        
        // Get the last day of the current month
        let range = calendar.range(of: .day, in: .month, for: today)!
        let lastDayOfCurrentMonth = calendar.date(bySetting: .day, value: range.upperBound - 1, of: today)!
        
        // Create predicate for this month
        let predicate = HKQuery.predicateForSamples(withStart: firstDayOfCurrentMonth, end: lastDayOfCurrentMonth, options: .strictStartDate)

        // Query workouts
        let query = HKSampleQuery(
            sampleType: HKObjectType.workoutType(),
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]
        ) { _, samples, error in
            guard let runs = samples as? [HKWorkout], error == nil else {
                print("Error fetching workouts: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            completion(runs)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get resting heart rate
    func getRestingHeartRate(completion: @escaping (Double?) -> Void) {
        guard let restingHRType = HKQuantityType.quantityType(forIdentifier: .restingHeartRate) else {
                completion(nil)
                return
            }

            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: [])

            let query = HKSampleQuery(
                sampleType: restingHRType,
                predicate: predicate,
                limit: 1,
                sortDescriptors: [sortDescriptor]
            ) { _, results, _ in
                guard let sample = results?.first as? HKQuantitySample else {
                    completion(nil)
                    return
                }

                let bpm = sample.quantity.doubleValue(for: .count().unitDivided(by: .minute()))
                completion(bpm)
            }

            healthStore.execute(query)
    }
    
    // MARK: Check access
    func checkAccess(completion: @escaping (Bool) -> Void) {
        let typesToRead: Set = [HKObjectType.workoutType()]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if success {
                self.healthStore.getRequestStatusForAuthorization(toShare: [], read: typesToRead) { status, error in
                    if let error = error {
                        print("Error getting request status: \(error.localizedDescription)")
                        return
                    }
                    
                    var hasAccess = false

                    switch status {
                    case .unknown:
                        print("Authorization status: Unknown")
                    case .shouldRequest:
                        print("Read access not yet requested")
                    case .unnecessary:
                        print("Read access already granted ✅")
                        hasAccess = true
                    @unknown default:
                        print("Unhandled status")
                    }
                    
                    completion(hasAccess)
                }
            } else {
                print("Health kit authorization failed: \(String(describing: error))")
            }
        }
    }
    
    // MARK: Request authorization
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let toRead: Set = [
            HKObjectType.workoutType(),
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        ]
                
        healthStore.requestAuthorization(toShare: nil, read: toRead) { success, error in
            if success {
                completion(success)
            } else {
                print("Health kit authorization failed: \(String(describing: error))")
            }
        }
    }
}
