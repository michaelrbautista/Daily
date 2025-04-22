//
//  UnpaidYearGraphView.swift
//  Daily
//
//  Created by Michael Bautista on 4/15/25.
//

import SwiftUI

struct UnpaidYearGraphView: View {
    @State var weeks = [[GraphDay]]()
    @State var months = [String]()
    
    let monthLabels = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    
    let calendar = Calendar.current
    let today = Date.now
    
    var body: some View {
        HStack {
            Spacer()
            
            // Add month labels
            VStack(spacing: 5) {
                // Spacer for day labels
                Text("")
                    .frame(width: 30, height: 30)
                
                ForEach(0..<weeks.count, id: \.self) { index in
                    Text(months[index])
                        .font(Font.FontStyles.caption2)
                        .foregroundColor(Color.ColorSystem.systemGray)
                        .frame(width: 30, height: 30)
                }
            }
            
            VStack(alignment: .center, spacing: 5) {
                HStack(spacing: 5) {
                    ForEach(0..<7, id: \.self) { index in
                        Text(days[index])
                            .font(Font.FontStyles.caption2)
                            .foregroundColor(Color.ColorSystem.systemGray)
                            .frame(width: 30, height: 30)
                    }
                }
                ForEach(weeks.indices, id: \.self) { weekIndex in
                    HStack(spacing: 5) {
                        ForEach(weeks[weekIndex]) { day in
                            ZStack {
                                Rectangle()
                                    .fill(color(for: day.intensity))
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(5)
                                    .overlay(
                                        TooltipGraphView(day: day),
                                        alignment: .top
                                    )
                            }
                        }
                    }
                }
            }
            
            // Add run count labels
            VStack(spacing: 5) {
                // Spacer for day labels
                Text("")
                    .frame(width: 30, height: 30)
                
                ForEach(0..<weeks.count, id: \.self) { index in
                    Text("")
                        .font(Font.FontStyles.caption2)
                        .foregroundColor(Color.ColorSystem.systemGray)
                        .frame(width: 30, height: 30)
                }
            }
            
            Spacer()
        }
        .onAppear {
            generateWeeklyGraph()
        }
    }
    
    // MARK: Generate weekly graph
    func generateWeeklyGraph() {
        let contributions = mockDays()
        var weeks: [[GraphDay]] = []
        var months: [String] = []
        var currentWeek: [GraphDay] = []
        
        var monthIndex = 0
        var addMonthLabel = false
        for day in contributions {
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
        
        DispatchQueue.main.async {
            self.weeks = weeks
            self.months = months
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
            let intensity = Int.random(in: 1...4)
            
            contributions.append(GraphDay(date: date, intensity: intensity, workouts: []))
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }

        return contributions
    }
    
    func color(for intensity: Int) -> Color {
        switch intensity {
        case 1:
            return Color.ColorSystem.graphGreen1
        case 2:
            return Color.ColorSystem.graphGreen2
        case 3:
            return Color.ColorSystem.graphGreen3
        case 4:
            return Color.ColorSystem.graphGreen4
        default: return Color.ColorSystem.systemGray6
        }
    }
}

#Preview {
    UnpaidYearGraphView()
}
