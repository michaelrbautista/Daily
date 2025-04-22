//
//  LoggedInView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct LoggedInView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            TrainingCoordinatorView()
                .tabItem {
                    Image(systemName: "figure.run")
                }
                .environmentObject(userViewModel)
            
            YearCoordinatorView()
                .tabItem {
                    Image(systemName: "calendar")
                }
                .environmentObject(userViewModel)
            
            SettingsCoordinatorView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
                .environmentObject(userViewModel)
        }
        .tint(Color.ColorSystem.primaryText)
    }
}

#Preview {
    LoggedInView()
        .environmentObject(UserViewModel())
}
