//
//  RunDetailViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/16/25.
//

import SwiftUI
import HealthKit

final class RunDetailViewModel: ObservableObject {
    
    var run: HKWorkout
    
    // For training impulse
    var averageHrDouble: Double
    var restingHeartRate: Double
    var maxHeartRate: Double
    var isMale: Bool
    
    // For average pace
    var distanceDouble: Double
    
    @Published var startTime: String
    @Published var distance: String
    @Published var duration: String
    @Published var averagePace: String
    @Published var averageHr: String
    @Published var workoutMaxHr: String
    @Published var trainingImpulse: String
    @Published var calories: String
    
    @Published var isLoading = true
    
    init(
        run: HKWorkout,
        restingHeartRate: Double,
        maxHeartRate: Double,
        isMale: Bool
    ) {
        self.run = run
        self.restingHeartRate = restingHeartRate
        self.maxHeartRate = maxHeartRate
        self.isMale = isMale
        
        self.averageHrDouble = 0.0
        
        self.distanceDouble = 0.0
        
        distance = "0.0"
        duration = "00:00:00"
        averagePace = "0:00 min/mile"
        averageHr = "0 bpm"
        workoutMaxHr = "0 bpm"
        trainingImpulse = "0"
        calories = "0"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        
        startTime = formatter.string(from: run.startDate)
    }
    
    // MARK: Get run stats
    @MainActor
    public func getRunStats() {
        self.isLoading = true
        
        let group = DispatchGroup()
        
        // MARK: Get distance
        if let runDistance = self.run.totalDistance {
            DispatchQueue.main.async {
                self.distanceDouble = runDistance.doubleValue(for: .mile())
                self.distance = "\(String(format: "%.2f", runDistance.doubleValue(for: .mile()))) miles"
            }
        } else {
            RunService.shared.getSingleRunDistance(
                group: group,
                healthStore: HealthKitService.shared.healthStore,
                run: self.run
            ) { fetchedDistance in
                if let distance = fetchedDistance {
                    self.distanceDouble = distance
                    self.distance = "\(String(format: "%.2f", distance)) miles"
                }
            }
        }
        
        // MARK: Get duration
        let hours = Int(run.duration) / 3600
        let minutes = (Int(run.duration) % 3600) / 60
        let seconds = Int(run.duration) % 60

        self.duration = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
        // MARK: Get average heart rate
        RunService.shared.getAverageHeartRate(
            group: group,
            healthStore: HealthKitService.shared.healthStore,
            run: run
        ) { avgHr in
            if let fetchedHr = avgHr {
                self.averageHrDouble = fetchedHr
                
                DispatchQueue.main.async {
                    self.averageHr = "\(Int(fetchedHr.rounded())) bpm"
                }
            }
        }
        
        // MARK: Get max heart rate
        RunService.shared.getMaxHeartRate(
            group: group,
            healthStore: HealthKitService.shared.healthStore,
            run: run
        ) { maxHr in
            if let fetchedHr = maxHr {
                DispatchQueue.main.async {
                    self.workoutMaxHr = "\(Int(fetchedHr.rounded())) bpm"
                }
            }
        }
        
        // MARK: Get calories
        RunService.shared.getCalories(
            group: group,
            healthStore: HealthKitService.shared.healthStore,
            run: run
        ) { cal in
            if let fetchedCal = cal {
                DispatchQueue.main.async {
                    self.calories = "\(Int(fetchedCal.rounded()))"
                }
            }
        }
        
        // After the queries
        group.notify(queue: .main) {
            // Training impulse
            let hrRelative = (self.averageHrDouble - self.restingHeartRate) / (self.maxHeartRate - self.restingHeartRate)
            let b = self.isMale ? 1.92 : 1.67
            let trimp = (Double(self.run.duration) / 60) * hrRelative * pow(M_E, b * hrRelative)
            
            self.trainingImpulse = "\(Int(trimp.rounded()))"
            
            // Average pace
            let durationInMinutes = self.run.duration / 60
            let pace = durationInMinutes / self.distanceDouble
            let minutes = Int(pace)
            let seconds = Int((pace - Double(minutes)) * 60)
            self.averagePace = String(format: "%d:%02d/mi", minutes, seconds)
            
            self.isLoading = false
        }
    }
    
}
