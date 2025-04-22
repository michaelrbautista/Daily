//
//  ToolTipView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct ContributionDay: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
    let level: Int  // 0–4 for intensity
}

struct ContributionGraphView: View {
    let weeks: [[ContributionDay]]
    let days = ["M", "T", "W", "T", "F", "S", "S"]

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 5) {
                // Month labels
                HStack(spacing: 5) {
                    Text("") // Spacer for day labels column
                        .frame(width: 30)

                    ForEach(weeks.indices, id: \.self) { index in
                        let week = weeks[index]
                        let firstDay = week.first!
                        let shouldShowMonth = index == 0 ||
                            Calendar.current.component(.month, from: firstDay.date) !=
                            Calendar.current.component(.month, from: weeks[index - 1].first!.date)

                        if shouldShowMonth {
                            Text(firstDay.date.formatted(.dateTime.month(.abbreviated)))
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .frame(width: 30, alignment: .center)
                                .padding(.bottom, 2)
                                .background(Color.ColorSystem.systemRed)
                        } else {
                            Text("") // Empty placeholder
                                .frame(width: 30)
                                .background(Color.ColorSystem.systemBlue)
                        }
                    }
                }

                // Graph: day labels + contributions
                HStack(alignment: .top, spacing: 5) {
                    // Day labels on the left
                    VStack(spacing: 5) {
                        ForEach(0..<7, id: \.self) { index in
                            Text(days[index])
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .frame(width: 30, height: 30)
                        }
                    }

                    // Contribution grid
                    HStack(alignment: .top, spacing: 5) {
                        ForEach(weeks.indices, id: \.self) { weekIndex in
                            VStack(spacing: 5) {
                                ForEach(weeks[weekIndex]) { day in
                                    Rectangle()
                                        .fill(color(for: day.level))
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(5)
                                        .overlay(
                                            TooltipView(day: day),
                                            alignment: .top
                                        )
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }

    func color(for level: Int) -> Color {
        switch level {
        case 1: return Color.green.opacity(0.3)
        case 2: return Color.green.opacity(0.5)
        case 3: return Color.green.opacity(0.7)
        case 4: return Color.green
        default: return Color.gray.opacity(0.15)
        }
    }
}

struct TooltipView: View {
    let day: ContributionDay
    @State private var showTooltip = false

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .contentShape(Rectangle())
            .onTapGesture {
                showTooltip.toggle()
            }
            .popover(isPresented: $showTooltip) {
                VStack(spacing: 8) {
                    Text(day.date, style: .date)
                    Text("\(day.count) contributions")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
            }
    }
}

// MARK: - Data Generator
func mockContributions() -> [ContributionDay] {
    let calendar = Calendar.current
    let today = Date()

    let currentYear = calendar.component(.year, from: today)
    let currentMonth = calendar.component(.month, from: today)

    var previousMonth = currentMonth - 1
    var previousYear = currentYear

    if previousMonth == 0 {
        previousMonth = 12
        previousYear -= 1
    }

    // Start of previous month
    let startDate = calendar.date(from: DateComponents(year: previousYear, month: previousMonth, day: 1))!

    // End of current month
    let startOfNextMonth = calendar.date(from: DateComponents(year: currentMonth == 12 ? currentYear + 1 : currentYear, month: (currentMonth % 12) + 1, day: 1))!
    let endDate = calendar.date(byAdding: .day, value: -1, to: startOfNextMonth)!

    // Extend to the end of the week containing the last day
    let lastWeekday = calendar.component(.weekday, from: endDate)
    let daysToAdd = 7 - lastWeekday
    let paddedEndDate = calendar.date(byAdding: .day, value: daysToAdd, to: endDate)!

    // Generate contributions
    var contributions: [ContributionDay] = []
    var date = startDate

    // Loop through dates, making sure not to go into the future
    while date <= paddedEndDate {
        // Prevent adding future days
        let isFuture = date > today
        let count = isFuture ? 0 : Int.random(in: 0...10)
        let level = isFuture ? 0 : Int.random(in: 1...3)

        contributions.append(ContributionDay(date: date, count: count, level: level))
        
        // Move to the next day
        date = calendar.date(byAdding: .day, value: 1, to: date)!
    }

    return contributions
}


func generateWeeklyGrid(from contributions: [ContributionDay]) -> [[ContributionDay]] {
    var weeks: [[ContributionDay]] = []
    var currentWeek: [ContributionDay] = []

    for day in contributions {
        currentWeek.append(day)
        if currentWeek.count == 7 {
            weeks.append(currentWeek)
            currentWeek = []
        }
    }
    
    if !currentWeek.isEmpty {
        // Pad to 7 days if needed
        while currentWeek.count < 7 {
            currentWeek.append(ContributionDay(date: Date(), count: 0, level: 0))
        }
        weeks.append(currentWeek)
    }
    
    return weeks
}

// MARK: - Preview

struct ContributionGraphView_Previews: PreviewProvider {
    static var previews: some View {
        let contributions = mockContributions()
        let weeks = generateWeeklyGrid(from: contributions)
        ContributionGraphView(weeks: weeks)
            .frame(height: 120)
            .previewLayout(.sizeThatFits)
    }
}

