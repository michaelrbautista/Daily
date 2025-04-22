//
//  RunService.swift
//  Daily
//
//  Created by Michael Bautista on 4/17/25.
//

import SwiftUI
import HealthKit

class RunService {
    
    public static let shared = RunService()
    
    // MARK: Get calories
    func getCalories(
        group: DispatchGroup,
        healthStore: HKHealthStore,
        run: HKWorkout,
        completion: @escaping ((Double?) -> Void)
    ) {
        group.enter()
        
        let energyType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!

        let predicate = HKQuery.predicateForSamples(withStart: run.startDate, end: run.endDate)

        let query = HKStatisticsQuery(quantityType: energyType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            defer { group.leave() }
            
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Couldn't get calories.")
                completion(nil)
                return
            }

            let kcal = quantity.doubleValue(for: .kilocalorie())
            completion(kcal)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get max heart rate
    func getMaxHeartRate(
        group: DispatchGroup,
        healthStore: HKHealthStore,
        run: HKWorkout,
        completion: @escaping (Double?) -> Void
    ) {
        group.enter()
        
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
            
        let predicate = HKQuery.predicateForSamples(withStart: run.startDate, end: run.endDate, options: .strictStartDate)
        
        let query = HKSampleQuery(
            sampleType: heartRateType,
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: nil
        ) { _, samples, error in
            defer { group.leave() }
            
            guard let heartRateSamples = samples as? [HKQuantitySample], error == nil else {
                print("Couldn't get max heart rate.")
                completion(nil)
                return
            }
            
            // Convert to bpm and find the max
            let maxHR = heartRateSamples
                .map { $0.quantity.doubleValue(for: .init(from: "count/min")) }
                .max()
            
            completion(maxHR)
        }
        
        healthStore.execute(query)
    }
    
    // MARK: Get average heart rate
    func getAverageHeartRate(
        group: DispatchGroup,
        healthStore: HKHealthStore,
        run: HKWorkout,
        completion: @escaping (Double?) -> Void
    ) {
        group.enter()
        
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }

        let predicate = HKQuery.predicateForSamples(withStart: run.startDate, end: run.endDate, options: .strictStartDate)

        let query = HKStatisticsQuery(
            quantityType: heartRateType,
            quantitySamplePredicate: predicate,
            options: .discreteAverage
        ) { _, statistics, _ in
            defer { group.leave() }
            
            guard let avgQuantity = statistics?.averageQuantity() else {
                print("Couldn't get average heart rate.")
                completion(nil)
                return
            }

            let bpm = avgQuantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))
            completion(bpm)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get year distance
    public func getYearDistance(
        group: DispatchGroup,
        healthStore: HKHealthStore,
        completion: @escaping ((Double?) -> Void)
    ) {
        group.enter()
        
        let calendar = Calendar.current
        let now = Date()
        guard let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: now)) else {
            completion(nil)
            return
        }

        let predicate = HKQuery.predicateForSamples(withStart: startOfYear, end: now)
        let workoutPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            predicate,
            HKQuery.predicateForWorkouts(with: .running)
        ])

        let workoutType = HKObjectType.workoutType()

        let query = HKSampleQuery(sampleType: workoutType,
                                  predicate: workoutPredicate,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: nil) { _, samples, error in
            defer { group.leave() }
            
            guard let workouts = samples as? [HKWorkout], error == nil else {
                print("Couldn't get total yearly distance.")
                completion(nil)
                return
            }

            let totalDistance = workouts.reduce(0.0) { sum, workout in
                return sum + (workout.totalDistance?.doubleValue(for: .mile()) ?? 0)
            }

            completion(totalDistance)
        }

        healthStore.execute(query)
    }
    
    // MARK: Get run distance
    public func getSingleRunDistance(
        group: DispatchGroup,
        healthStore: HKHealthStore,
        run: HKWorkout,
        completion: @escaping ((Double?) -> Void)
    ) {
        group.enter()
        
        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!

        let predicate = HKQuery.predicateForObjects(from: run)

        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            defer { group.leave() }
            
            guard let quantity = result?.sumQuantity() else {
                print("Couldn't get single run distance.")
                completion(nil)
                return
            }

            let miles = quantity.doubleValue(for: .mile())
            completion(miles)
        }

        healthStore.execute(query)
    }
    
}
