//
//  DailyHelpsView.swift
//  Daily
//
//  Created by Michael Bautista on 4/13/25.
//

import SwiftUI

struct DailyHelpsView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    @State var isReading = true
    
    var body: some View {
        VStack {
            Text("Daily helps you visualize your consistency, so you stay disciplined.")
                .font(Font.FontStyles.title3)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            Image("onboardingMockup")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320)
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
                navigationController.push(.CreateAccountView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    DailyHelpsView(viewModel: OnboardingViewModel())
}
