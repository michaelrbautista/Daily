//
//  ProgramWeekDetailView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct ProgramWeekDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var shouldUseSheetNavigation: Bool
    
    var week: ProgramWeek
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        List {
            Text("Week \(week.week)")
                .font(Font.FontStyles.title1)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.ColorSystem.systemBackground)
            
            ForEach(week.runs.indices, id:\.self) { index in
                WeekDayCell(day: days[index], run: week.runs[index])
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                    .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .onTapGesture {
                        if shouldUseSheetNavigation {
                            sheetNavigationController.push(.ProgramRunDetailView(day: days[index], week: "Week \(week.week)", run: week.runs[index]))
                        } else {
                            navigationController.push(.ProgramRunDetailView(day: days[index], week: "Week \(week.week)", run: week.runs[index]))
                        }
                    }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    ProgramWeekDetailView(shouldUseSheetNavigation: true, week: ProgramWeek(week: 3, runs: [
        ProgramRun(type: .EasyRun, distance: 3),
        ProgramRun(type: .EasyRun, distance: 0),
        ProgramRun(type: .EasyRun, distance: 6),
        ProgramRun(type: .Rest, distance: 0),
        ProgramRun(type: .EasyRun, distance: 3),
        ProgramRun(type: .EasyRun, distance: 2),
        ProgramRun(type: .Rest, distance: 0)
    ]))
}
