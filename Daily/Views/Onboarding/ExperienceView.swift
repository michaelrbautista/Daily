//
//  ExperienceView.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

import SwiftUI

struct ExperienceView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            Text("How experienced are you with running and lifting?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Beginner",
                    subtext: "You're just getting into running.",
                    selection: $viewModel.experience
                ) {
                    viewModel.experience = "Beginner"
                }
                
                SelectListRow(
                    text: "Intermediate",
                    subtext: "You've run a half marathon and done some structured training.",
                    selection: $viewModel.experience
                ) {
                    viewModel.experience = "Intermediate"
                }
                
                SelectListRow(
                    text: "Advanced",
                    subtext: "You've run a marathon and followed a structured program.",
                    selection: $viewModel.experience
                ) {
                    viewModel.experience = "Advanced"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.experience == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.GoalView(viewModel: viewModel))
            }

        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    ExperienceView()
}
