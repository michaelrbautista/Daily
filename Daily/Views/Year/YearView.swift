//
//  YearView.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

import SwiftUI

struct YearView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        if userViewModel.isSubscribed {
            PaidYearView()
        } else {
            UnpaidYearView()
                .onAppear {
                    Task {
                        userViewModel.isSubscribed = try await RevenueCatService.shared.checkSubscription()
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        YearView()
            .environmentObject(UserViewModel())
    }
}
