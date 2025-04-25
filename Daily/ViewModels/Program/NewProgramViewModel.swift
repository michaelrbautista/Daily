//
//  NewProgramViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI
import StoreKit
import RevenueCat

final class NewProgramViewModel: ObservableObject {
    
    @Published var newProgram: Program? = nil
    
    #if DEBUG
    @Published var experience = "Advanced"
    @Published var goal = "Half marathon"
    @Published var longRunDay = "Sunday"
    @Published var mileTimeMinutes = "5"
    @Published var mileTimeSeconds = "30"
    @Published var startDate = Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 2), matchingPolicy: .nextTime) ?? Date()
    #else
    @Published var experience = ""
    @Published var goal = ""
    @Published var longRunDay = ""
    @Published var mileTimeMinutes = ""
    @Published var mileTimeSeconds = ""
    @Published var startDate = Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 2), matchingPolicy: .nextTime) ?? Date()
    #endif
    
    @Published var isCreating = false
    @Published var isSaving = false
    
    @Published var returnedError = false
    @Published var errorMessage = ""
    
    // MARK: Save program
    @MainActor
    public func saveNewProgram() {
        self.isSaving = true
        
        // Save program details
        UserDefaults.standard.set(experience, forKey: "experience")
        UserDefaults.standard.set(goal, forKey: "goal")
        UserDefaults.standard.set(longRunDay, forKey: "longRunDay")
        UserDefaults.standard.set(mileTimeMinutes, forKey: "mileTimeMinutes")
        UserDefaults.standard.set(mileTimeSeconds, forKey: "mileTimeSeconds")
        UserDefaults.standard.set(startDate, forKey: "startDate")
    }
    
    // MARK: Create program
    @MainActor
    public func createGeneralProgram() {
        self.isCreating = true
        
        self.newProgram = ProgramService.shared.getProgram(
            experience: experience,
            goal: goal,
            longRunDay: longRunDay
        )
    }
}
