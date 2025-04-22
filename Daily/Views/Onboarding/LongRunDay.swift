//
//  LongRunDay.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

import SwiftUI

struct LongRunDay: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What day do you want to do your long run?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                SelectListRow(
                    text: "Saturday",
                    selection: $viewModel.longRunDay
                ) {
                    viewModel.longRunDay = "Saturday"
                }
                
                SelectListRow(
                    text: "Sunday",
                    selection: $viewModel.longRunDay
                ) {
                    viewModel.longRunDay = "Sunday"
                }
            }
            Spacer()
            StyledButton(
                variant: viewModel.longRunDay == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.MileTimeView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    LongRunDay(viewModel: OnboardingViewModel())
}
