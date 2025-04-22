//
//  DaysPerWeek.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

import SwiftUI

struct DaysPerWeek: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("How many days a week do you want to train?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "5",
                    selection: $viewModel.daysPerWeek
                ) {
                    viewModel.daysPerWeek = "5"
                }
                
                SelectListRow(
                    text: "6",
                    selection: $viewModel.daysPerWeek
                ) {
                    viewModel.daysPerWeek = "6"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.daysPerWeek == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.LongRunDayView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    DaysPerWeek(viewModel: OnboardingViewModel())
}
