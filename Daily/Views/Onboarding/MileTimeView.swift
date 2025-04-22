//
//  MileTimeView.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

import SwiftUI

struct MileTimeView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("What's your current mile time?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            HStack(spacing: 10) {
                TextField("Minutes", text: $viewModel.mileTimeMinutes)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .keyboardType(.numberPad)
                
                Text(":")
                    .font(Font.FontStyles.title3)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                TextField("Seconds", text: $viewModel.mileTimeSeconds)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .keyboardType(.numberPad)
            }
            .listRowBackground(Color.ColorSystem.systemBackground)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            StyledButton(
                variant: viewModel.mileTimeMinutes == "" || viewModel.mileTimeSeconds == "" ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.CreatingProgramView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    MileTimeView(viewModel: OnboardingViewModel())
}
