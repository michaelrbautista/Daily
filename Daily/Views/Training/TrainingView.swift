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
            
            Section {
                ForEach(viewModel.todaysRuns, id: \.self) { run in
                    WorkoutCell(
                        distance: run.distance,
                        duration: run.duration
                    )
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .listRowSeparator(.hidden)
                }
            } header: {
                Text("Today")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            }
            .headerProminence(.increased)
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                Button {
//                    navigationController.presentSheet(.ShareView)
//                } label: {
//                    Text("Share")
//                        .foregroundStyle(Color.ColorSystem.primaryText)
//                }
//            }
        }
    }
}

#Preview {
    NavigationStack {
        TrainingView()
            .environmentObject(UserViewModel())
    }
}
