//
//  YearViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

import SwiftUI

final class YearViewModel: ObservableObject {
    
    @Published var days = [GraphDay]()
    @Published var weeks = [[GraphDay]]()
    @Published var months = [String]()
    
    let monthLabels = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    
    var currentMonth: String
    var totalRuns = 0
    var totalDistance = 0.0
    
    init() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        self.currentMonth = dateFormatter.string(from: currentDate)
        
        generateInitialGraph()
    }
    
    // MARK: Get this year's workouts
    func getThisYearsWorkouts(
        restingHeartRate: Double,
        maxHeartRate: Double,
        gender: String
    ) {
        let group = DispatchGroup()
        
        RunService.shared.getYearDistance(
            group: group,
            healthStore: HealthKitService.shared.healthStore
        ) { distance in
            if let fetchedDistance = distance {
                self.totalDistance = fetchedDistance
            }
        }
        
        // Get this month's workouts
        // runs: Dictionary<String, HKWorkout>
        HealthKitService.shared.getCurrentYearsWorkouts { runs in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            DispatchQueue.main.async {
                self.totalRuns = runs.count
            }
            
            for day in 0..<self.days.count {
                group.enter()
                
                if let daysRuns = runs[formatter.string(from: self.days[day].date)] {
                    var totalIntensity = 0
                    
                    for run in daysRuns {
                        var avgHr = 135.0
                        var maxHr = 155.0
                        
                        // Get distance
                        
                        
                        // Get average heart rate
                        RunService.shared.getAverageHeartRate(
                            group: group,
                            healthStore: HealthKitService.shared.healthStore,
                            run: run
                        ) { avgHrResult in
                            if let hr = avgHrResult {
                                avgHr = hr
                            }
                        }
                        
                        // Get max heart rate
                        RunService.shared.getMaxHeartRate(
                            group: group,
                            healthStore: HealthKitService.shared.healthStore,
                            run: run
                        ) { maxHrResult in
                            if let hr = maxHrResult {
                                maxHr = hr
                            }
                        }
                        
                        // Get intensity score
                        let intensity = TrainingDataService.shared.calculateIntensity(
                            durationMinutes: run.duration / 60,
                            hrAvg: avgHr,
                            hrRest: restingHeartRate,
                            hrMax: maxHr,
                            isMale: gender == "Male"
                        )
                        
                        totalIntensity += intensity
                        
                        DispatchQueue.main.async {
                            self.days[day].workouts.append(run)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.days[day].intensity = totalIntensity
                    }
                }
                
                group.leave()
            }
            
            // After the queries
            group.notify(queue: .main) {
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
    
    // MARK: Generate months
    func getMonthsForGraph(days: [GraphDay]) -> [String] {
        var months = [String]()
        var currentWeek: [GraphDay] = []
        
        var monthIndex = 0
        var addMonthLabel = false
        for day in days {
            currentWeek.append(day)
            
            let calendar = Calendar.current
            let today = Date.now
            let currentYear = calendar.component(.year, from: today)
            
            if (calendar.component(.day, from: day.date) == 1 && calendar.component(.year, from: day.date) == currentYear) {
                addMonthLabel = true
            }
            
            if currentWeek.count == 7 {
                // If the week contains the first day of the month, add label
                if addMonthLabel {
                    months.append(monthLabels[monthIndex])
                    monthIndex += 1
                    addMonthLabel = false
                } else {
                    months.append("")
                }
                
                currentWeek = []
            }
        }
        
        return months
    }
    
    // MARK: Get days for graph
    func getDaysForGraph() -> [GraphDay] {
        let calendar = Calendar.current
        let today = Date.now
        let currentYear = calendar.component(.year, from: today)
        
        // Get first day of the year
        var firstDayComponents = DateComponents()
        firstDayComponents.year = currentYear
        firstDayComponents.month = 1
        firstDayComponents.day = 1

        let firstDayOfYear = calendar.date(from: firstDayComponents)!
        
        // Get the first day of the week that contains the first day of the year
        let startDate = calendar.date(byAdding: .day, value: 1 - calendar.component(.weekday, from: firstDayOfYear), to: firstDayOfYear)!
        
        // Get the last day of the current year
        var lastDayComponents = DateComponents()
        lastDayComponents.year = currentYear
        lastDayComponents.month = 12
        lastDayComponents.day = 31
        
        let lastDayOfYear = calendar.date(from: lastDayComponents)!
        
        // Get the last day of the week that contains the last day of the current year
        let endDate = calendar.date(byAdding: .day, value: 7 - calendar.component(.weekday, from: lastDayOfYear), to: lastDayOfYear)!

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
        
        // Get months
        let initialMonths = self.getMonthsForGraph(days: initialDays)
        
        DispatchQueue.main.async {
            self.days = initialDays
            self.weeks = initialWeeks
            self.months = initialMonths
        }
    }
    
    // MARK: Mock days
    func mockDays() -> [GraphDay] {
        let calendar = Calendar.current
        let today = Date.now
        let currentYear = calendar.component(.year, from: today)
        
        // Get first day of the year
        var firstDayComponents = DateComponents()
        firstDayComponents.year = currentYear
        firstDayComponents.month = 1
        firstDayComponents.day = 1

        let firstDayOfYear = calendar.date(from: firstDayComponents)!
        
        // Get the first day of the week that contains the first day of the year
        let startDate = calendar.date(byAdding: .day, value: 1 - calendar.component(.weekday, from: firstDayOfYear), to: firstDayOfYear)!
        
        // Get the last day of the current year
        var lastDayComponents = DateComponents()
        lastDayComponents.year = currentYear
        lastDayComponents.month = 12
        lastDayComponents.day = 31
        
        let lastDayOfYear = calendar.date(from: lastDayComponents)!
        
        // Get the last day of the week that contains the last day of the current year
        let endDate = calendar.date(byAdding: .day, value: 7 - calendar.component(.weekday, from: lastDayOfYear), to: lastDayOfYear)!

        // Generate contributions
        var contributions: [GraphDay] = []
        var date = startDate

        while date <= endDate {
            let isFuture = date > today
            let isCurrentYear = calendar.component(.year, from: date) == currentYear
            
            var intensity = Int.random(in: 1...4)
            if isFuture || !isCurrentYear {
                intensity = 0
            }
            
            contributions.append(GraphDay(date: date, intensity: intensity, workouts: []))
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }

        return contributions
    }
}
