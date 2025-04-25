//
//  RunDetailView.swift
//  Daily
//
//  Created by Michael Bautista on 4/18/25.
//

import SwiftUI
import HealthKit

struct RunDetailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: RunDetailViewModel
    
    var date: String
    
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
                .onAppear {
                    viewModel.getRunStats()
                }
        } else {
            List {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("🏃‍♂️")
                            .font(Font.FontStyles.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text("Run")
                                .font(Font.FontStyles.title2)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                            
                            Text(viewModel.startTime)
                                .font(Font.FontStyles.headline)
                                .foregroundStyle(Color.ColorSystem.systemGray)
                        }
                    }
                    
                    HStack {
                        WorkoutDetailCell(title: "Distance", subtitle: viewModel.distance)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        WorkoutDetailCell(title: "Duration", subtitle: viewModel.duration)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        WorkoutDetailCell(title: "Average Pace", subtitle: viewModel.averagePace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        WorkoutDetailCell(title: "Average HR", subtitle: viewModel.averageHr)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        WorkoutDetailCell(title: "Max HR", subtitle: viewModel.workoutMaxHr)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        WorkoutDetailCell(title: "Training Impulse", subtitle: viewModel.trainingImpulse)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        WorkoutDetailCell(title: "Calories", subtitle: viewModel.calories)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        WorkoutDetailCell(title: "", subtitle: "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle(date)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
        }
    }
}

#Preview {
    RunDetailView(viewModel: RunDetailViewModel(run: HKWorkout(activityType: .running, start: Date(), end: Date().addingTimeInterval(3600)), restingHeartRate: 55.0, maxHeartRate: 195.0, isMale: true), date: "Wed, Apr 9")
}
