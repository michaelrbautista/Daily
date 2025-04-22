//
//  TrainingViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

import SwiftUI
import HealthKit

final class TrainingViewModel: ObservableObject {
    
    @Published var days = [GraphDay]()
    @Published var weeks: [[GraphDay]]?
    
    @Published var todaysRuns = [Run]()
    @Published var hasAccessToHealth = false
    
    var currentMonth: String
    var runCount: Int
    
    init() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        self.currentMonth = dateFormatter.string(from: currentDate)
        
        let calendar = Calendar.current
        self.runCount = calendar.component(.day, from: currentDate)
        
        generateInitialGraph()
    }
    
    // MARK: Get this month's workouts
    func getThisMonthsWorkouts(
        restingHeartRate: Double,
        maxHeartRate: Double,
        gender: String
    ) {
        // Get this month's workouts
        // runs: Dictionary<String, HKWorkout>
        HealthKitService.shared.getCurrentMonthsWorkouts { runs in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            let group = DispatchGroup()
            
            for day in 0..<self.days.count {
                if let daysRuns = runs[formatter.string(from: self.days[day].date)] {
                    group.enter()
                    
                    var totalIntensity = 0
                    
                    let outerGroup = DispatchGroup()
                    
                    for run in daysRuns {
                        outerGroup.enter()
                        
                        let innerGroup = DispatchGroup()
                        
                        var avgHr = 135.0
                        
                        // Get average heart rate
                        RunService.shared.getAverageHeartRate(
                            group: innerGroup,
                            healthStore: HealthKitService.shared.healthStore,
                            run: run
                        ) { avgHrResult in
                            if let hr = avgHrResult {
                                avgHr = hr
                            }
                        }
                        
                        innerGroup.notify(queue: .main) {
                            // Get intensity score
                            let intensity = TrainingDataService.shared.calculateIntensity(
                                durationMinutes: run.duration / 60,
                                hrAvg: avgHr,
                                hrRest: restingHeartRate,
                                hrMax: maxHeartRate,
                                isMale: gender == "Male"
                            )
                            
                            totalIntensity += intensity
                            
                            DispatchQueue.main.async {
                                self.days[day].workouts.append(run)
                            }
                            
                            outerGroup.leave()
                        }
                    }
                    
                    outerGroup.notify(queue: .main) {
                        DispatchQueue.main.async {
                            self.days[day].intensity = totalIntensity
                        }
                        
                        group.leave()
                    }
                }
            }
            
            group.notify(queue: .main) {
                DispatchQueue.main.async {
                    self.weeks = self.generateWeeklyGraph(from: self.days)
                }
            }
            
            if let todaysRuns = runs[formatter.string(from: Date.now)] {
                // Convert to run object
                for run in 0..<todaysRuns.count {
                    var distance = 0.0
                    var duration = ""
                    
                    // Get duration
                    let hours = Int(todaysRuns[run].duration) / 3600
                    let minutes = (Int(todaysRuns[run].duration) % 3600) / 60
                    let seconds = Int(todaysRuns[run].duration) % 60

                    duration = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
                    
                    let group = DispatchGroup()
                    
                    // Get distance
                    if let runDistance = todaysRuns[run].totalDistance {
                        DispatchQueue.main.async {
                            distance = runDistance.doubleValue(for: .mile())
                        }
                    } else {
                        RunService.shared.getSingleRunDistance(
                            group: group,
                            healthStore: HealthKitService.shared.healthStore,
                            run: todaysRuns[run]
                        ) { distanceResult in
                            if let runDistance = distanceResult {
                                distance = runDistance
                            }
                        }
                    }
                    
                    // Add to today's runs
                    DispatchQueue.main.async {
                        self.todaysRuns.append(Run(distance: distance, duration: duration))
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.weeks = self.generateWeeklyGraph(from: self.days)
            }
        }
    }
    
    // MARK: Generate weekly graph
    func generateWeeklyGraph(from days: [GraphDay]) -> [[GraphDay]] {
        var weeks: [[GraphDay]] = []
        var currentWeek: [GraphDay] = []

        for day in days {
            currentWeek.append(day)
            if currentWeek.count == 7 {
                weeks.append(currentWeek)
                currentWeek = []
            }
        }
        
        if !currentWeek.isEmpty {
            // Pad to 7 days if needed
            while currentWeek.count < 7 {
                currentWeek.append(GraphDay(date: Date(), intensity: 0, workouts: []))
            }
            weeks.append(currentWeek)
        }
        
        return weeks
    }
    
    // MARK: Get days for graph
    func getDaysForGraph() -> [GraphDay] {
        let calendar = Calendar.current
        let today = Date.now

        // Get the first day of the current month
        let firstDayOfCurrentMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
        
        // Get the first day of the week that contains the first day of the current month
        let startDate = calendar.date(byAdding: .day, value: 1 - calendar.component(.weekday, from: firstDayOfCurrentMonth), to: firstDayOfCurrentMonth)!
        
        // Get the last day of the current month
        let range = calendar.range(of: .day, in: .month, for: today)!
        let lastDayOfCurrentMonth = calendar.date(bySetting: .day, value: range.upperBound - 1, of: today)!
        
        // Get the last day of the week that contains the last day of the current month
        let endDate = calendar.date(byAdding: .day, value: 7 - calendar.component(.weekday, from: lastDayOfCurrentMonth), to: lastDayOfCurrentMonth)!

        // Generate contributions
        var days: [GraphDay] = []
        var date = startDate

        while date <= endDate {
            days.append(GraphDay(date: date, intensity: 0, workouts: []))
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }

        return days
    }
    
    // MARK: Generate initial graph
    func generateInitialGraph() {
        // Get days
        let initialDays = self.getDaysForGraph()
        
        // Create initial graph
        let initialWeeks = self.generateWeeklyGraph(from: initialDays)
        
        DispatchQueue.main.async {
            self.days = initialDays
            self.weeks = initialWeeks
        }
    }
}
