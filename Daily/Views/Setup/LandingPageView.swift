//
//  LandingPageView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            Image("landingPageMockupCropped")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 260)
            
            VStack {
                Image("dailyTitle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                Text("Consistency compounds.")
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            }
            
            VStack(spacing: 10) {
                StyledButton(
                    variant: .primary,
                    text: "Get Started",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.ExperienceView)
                }
                
                StyledButton(
                    variant: .secondary,
                    text: "Sign In",
                    isLoading: .constant(false)
                ) {
                    navigationController.push(.SignInView)
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

#Preview {
    LandingPageView()
}
