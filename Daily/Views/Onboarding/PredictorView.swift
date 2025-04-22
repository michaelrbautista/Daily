//
//  PredictorView.swift
//  Daily
//
//  Created by Michael Bautista on 4/13/25.
//

import SwiftUI

struct PredictorView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    @State var isReading = true
    
    var body: some View {
        VStack {
            Text("The best predictor of progress for endurance athletes is...")
                .font(Font.FontStyles.title3)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            Text("Consistency.")
                .italic()
                .onAppear {
                    #if DEBUG
                    self.isReading = false
                    #else
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.isReading = false
                    }
                    #endif
                }
            Spacer()
            StyledButton(
                variant: isReading ? .disabled : .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                if viewModel.goal != "Just want to track my runs" {
                    navigationController.push(.LongRunDayView(viewModel: viewModel))
                } else {
                    navigationController.push(.ConsistentlyGoodView(viewModel: viewModel))
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    PredictorView(viewModel: OnboardingViewModel())
}
