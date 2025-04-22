//
//  OnboardingViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import StoreKit
import RevenueCat

final class OnboardingViewModel: ObservableObject {
    
    @Published var experience = ""
    @Published var goal = ""
    @Published var daysPerWeek = ""
    @Published var longRunDay = ""
    @Published var mileTimeMinutes = ""
    @Published var mileTimeSeconds = ""
    
    @Published var email = ""
    @Published var fullName = ""
    @Published var username = ""
    @Published var age = ""
    @Published var gender = "Male"
    
    @Published var isValidEmail = false
    @Published var isValidUsername = false
    
    @Published var isLoading = false
    @Published var isCreating = true
    @Published var isWaitingForPaywall = true
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Check username
    @MainActor
    public func checkUsername() async -> Bool {
        returnedError = false
        errorMessage = ""
        isLoading = true
        
        // Check regex
        let usernameRegex = #"^[a-zA-Z0-9._]{3,15}$"#
        let isValid = NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: self.username)
        
        if !isValid {
            returnedError = true
            errorMessage = "Username must be between 3 and 15 characters and can only contain letters, numbers, periods, and underscores."
            isLoading = false
            return false
        }
        
        // Check database
        let isAvailable = await UserService.shared.checkUsername(username: username)
        
        if isAvailable {
            isLoading = false
            return true
        } else {
            returnedError = true
            errorMessage = "That username isn't available. Please choose another one."
            isLoading = false
            return false
        }
    }
}
