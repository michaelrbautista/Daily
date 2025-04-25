//
//  ProgramRunDetailView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct ProgramRunDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var day: String
    var week: String
    var run: ProgramRun
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(day)
                    .font(Font.FontStyles.title1)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                Text(week)
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.ColorSystem.systemBackground)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            if run.type == .SpeedWorkout {
                // MARK: Speed workout
                Section {
                    if let segments = run.workoutSegments {
                        ForEach(Array(segments.enumerated()), id: \.offset) { index, segment in
                            VStack(alignment: .leading) {
                                Text(segment.title)
                                    .font(Font.FontStyles.headline)
                                    .foregroundStyle(Color.ColorSystem.primaryText)
                                
                                Text(segment.description)
                                    .font(Font.FontStyles.body)
                                    .foregroundStyle(Color.ColorSystem.systemGray)
                            }
                            .listRowBackground(Color.ColorSystem.systemGray6)
                        }
                    }
                } header: {
                    Text("Speed Workout")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
                .headerProminence(.increased)
            } else if run.type == .EasyRun {
                Section {
                    // MARK: Easy run
                    if let distance = run.distance {
                        VStack(alignment: .leading) {
                            Text("\(distance) miles")
                                .font(Font.FontStyles.headline)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                            
                            Text("At an easy pace.")
                                .font(Font.FontStyles.body)
                                .foregroundStyle(Color.ColorSystem.systemGray)
                        }
                        .listRowBackground(Color.ColorSystem.systemGray6)
                    }
                } header: {
                    Text("Easy Run")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
                .headerProminence(.increased)
            } else if run.type == .LongRun {
                // MARK: Long run
                Section {
                    if let distance = run.distance {
                        VStack(alignment: .leading) {
                            Text("\(distance) miles")
                                .font(Font.FontStyles.headline)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                            
                            Text("At an easy pace.")
                                .font(Font.FontStyles.body)
                                .foregroundStyle(Color.ColorSystem.systemGray)
                        }
                        .listRowBackground(Color.ColorSystem.systemGray6)
                    }
                } header: {
                    Text("Long Run")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
                .headerProminence(.increased)
            } else if run.type == .Race {
                // MARK: Race
                Section {
                    VStack(alignment: .leading) {
                        Text("Time to get to work.")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                    }
                    .listRowBackground(Color.ColorSystem.systemGray6)
                } header: {
                    Text("Race Day")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                }
                .headerProminence(.increased)
            } else {
                // MARK: Rest
                if let distance = run.distance {
                    VStack(alignment: .leading) {
                        Text("No runs today")
                            .font(Font.FontStyles.headline)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                        
                        Text("Complete rest or active recovery like walking or mobility.")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.systemGray)
                    }
                    .listRowBackground(Color.ColorSystem.systemGray6)
                }
            }
            
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    ProgramRunDetailView(day: "Monday", week: "Week 1", run: ProgramRun(type: .Race, distance: 0))
}
