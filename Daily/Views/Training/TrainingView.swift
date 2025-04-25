//
//  TrainingView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import HealthKit

struct TrainingView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel = TrainingViewModel()
    
    @State var hasAppeared = false
    
    var body: some View {
        List {
            Section {
                MonthGraphView(viewModel: viewModel)
                    .listRowSeparator(.hidden)
                    .onAppear {
                        if !hasAppeared {
                            hasAppeared = true
                            viewModel.getThisMonthsWorkouts(restingHeartRate: userViewModel.restingHeartRate, maxHeartRate: userViewModel.maxHeartRate, gender: UserService.currentUser?.gender ?? "Male")
                        }
                    }
            }
            
            if viewModel.todaysScheduledRuns.count > 0 {
                Section {
                    ForEach(viewModel.todaysScheduledRuns, id: \.self) { run in
                        ScheduledRunCell(run: run)
                            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                navigationController.push(.ProgramRunDetailView(day: viewModel.programDay, week: "Week \(viewModel.programWeek)", run: run))
                            }
                    }
                } header: {
                    Text("Scheduled")
                        .font(Font.FontStyles.title3)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                .headerProminence(.increased)
            }
            
            if viewModel.todaysCompletedRuns.count > 0 {
                Section {
                    ForEach(viewModel.todaysCompletedRuns, id: \.self) { run in
                        WorkoutCell(
                            distance: run.distance,
                            duration: run.duration
                        )
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "E, MMM d"
                            let formattedString = formatter.string(from: Date())
                            
                            let vm = RunDetailViewModel(
                                run: run.runWorkout,
                                restingHeartRate: userViewModel.restingHeartRate,
                                maxHeartRate: userViewModel.maxHeartRate,
                                isMale: UserService.currentUser?.gender == "Male"
                            )
                            
                            navigationController.push(.RunDetailView(viewModel: vm, date: formattedString))
                        }
                    }
                } header: {
                    Text("Completed")
                        .font(Font.FontStyles.title3)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                .headerProminence(.increased)
                
                #if DEBUG
                Button {
                    let previousMonday = Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 2), matchingPolicy: .nextTime, direction: .backward)!
                    UserDefaults.standard.set(previousMonday, forKey: "startDate")
                } label: {
                    HStack {
                        Text("Set start date")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets(top: 40, leading: 20, bottom: 200, trailing: 20))
                .listRowSeparator(.hidden)
                #endif
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
        .refreshable {
            viewModel.getTrainingProgramWorkouts()
            
            viewModel.getThisMonthsWorkouts(restingHeartRate: userViewModel.restingHeartRate, maxHeartRate: userViewModel.maxHeartRate, gender: UserService.currentUser?.gender ?? "Male")
        }
    }
}

#Preview {
    NavigationStack {
        TrainingView()
            .environmentObject(UserViewModel())
    }
}
