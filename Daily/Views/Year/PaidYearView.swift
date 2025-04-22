//
//  PaidYearView.swift
//  Daily
//
//  Created by Michael Bautista on 4/15/25.
//

import SwiftUI

struct PaidYearView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel = YearViewModel()
    
    @State var hasAppeared = false
    
    var body: some View {
        List {
            Section {
                VStack(spacing: 10) {
                    HStack {
                        Text("🏃‍♂️")
                        Text("\(viewModel.totalRuns) runs")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("🛣️")
                        Text("\(String(format: "%.1f", viewModel.totalDistance)) miles")
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
            } header: {
                Text("This year")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            }
            .headerProminence(.increased)
            
            Section {
                YearGraphView(viewModel: viewModel)
                    .listRowSeparator(.hidden)
                    .onAppear {
                        if !hasAppeared {
                            hasAppeared = true
                            viewModel.getThisYearsWorkouts(restingHeartRate: userViewModel.restingHeartRate, maxHeartRate: userViewModel.maxHeartRate, gender: UserService.currentUser?.gender ?? "Male")
                        }
                    }
                Text("")
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(String(Calendar.current.component(.year, from: Date())))
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
    PaidYearView()
        .environmentObject(UserViewModel())
}
