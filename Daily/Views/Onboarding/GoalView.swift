//
//  GoalView.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What are you training for?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Base training",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "Base training"
                }
                
                SelectListRow(
                    text: "10k",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "10k"
                }
                
                SelectListRow(
                    text: "Half marathon",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "Half marathon"
                }
                
                SelectListRow(
                    text: "Marathon",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "Marathon"
                }
                
                SelectListRow(
                    text: "Just want to track my runs",
                    selection: $viewModel.goal
                ) {
                    viewModel.goal = "Just want to track my runs"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.goal == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                if viewModel.goal != "Just want to track my runs" {
                    navigationController.push(.PredictorView(viewModel: viewModel))
                } else {
                    navigationController.push(.PredictorView(viewModel: viewModel))
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    GoalView(viewModel: OnboardingViewModel())
}
