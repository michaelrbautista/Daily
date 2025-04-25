//
//  UserViewModel.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import Supabase
import RevenueCat
import SuperwallKit
import HealthKit

@MainActor
class UserViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var event: AuthChangeEvent? = nil
    @Published var session: Session? = nil
    
    @Published var isSubscribed = false
    
    @Published var hasHealthAccess = false
    @Published var restingHeartRate = 55.0
    @Published var maxHeartRate = 195.0
    
    @Published var program: Program? = nil
    @Published var startDate: Date? = nil
    
    init() {
        self.isLoading = true
        
        Task {
            await checkAuth()
            
            HealthKitService.shared.requestAuthorization { success in
                DispatchQueue.main.async {
                    self.hasHealthAccess = success
                }
            }
            
            HealthKitService.shared.getRestingHeartRate { rhr in
                if let rhr = rhr {
                    DispatchQueue.main.async {
                        self.restingHeartRate = rhr
                    }
                }
            }
        }
    }
    
    // MARK: Check auth
    @MainActor
    public func checkAuth() async {
        self.isLoading = true
        
        do {
            let _ = try await SupabaseService.shared.supabase.auth.session
            
            let authUser = try await SupabaseService.shared.supabase.auth.session.user
            
            // Get user from db
            let user: User = try await SupabaseService.shared.supabase
                .from("users")
                .select()
                .eq("id", value: authUser.id)
                .single()
                .execute()
                .value
            
            UserService.currentUser = user
            
            self.maxHeartRate = 208 - (0.7 * Double(user.age))
            
            // Check if user is subscribed
            self.isSubscribed = try await RevenueCatService.shared.checkSubscription()
            
            #if DEBUG
            self.isSubscribed = true
            #endif
            
            // Check if user has started a program
            self.startDate = UserDefaults.standard.value(forKey: "startDate") as? Date
            
            let experience = UserDefaults.standard.value(forKey: "experience") as? String
            let goal = UserDefaults.standard.value(forKey: "goal") as? String
            let longRunDay = UserDefaults.standard.value(forKey: "longRunDay") as? String
            let mileTimeMinutes = UserDefaults.standard.value(forKey: "mileTimeMinutes") as? String
            let mileTimeSeconds = UserDefaults.standard.value(forKey: "mileTimeSeconds") as? String
            
            if experience != nil && goal != nil && longRunDay != nil && mileTimeMinutes != nil && mileTimeSeconds != nil {
                self.program = ProgramService.shared.getProgram(
                    experience: experience!,
                    goal: goal!,
                    longRunDay: longRunDay!
                )
            }
            
            self.isLoggedIn = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isLoading = false
            }
//            self.isLoggedIn = true
//            self.isLoading = false
        } catch {
            print(error)
            self.isLoggedIn = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isLoading = false
            }
//            self.isLoggedIn = false
//            self.isLoading = false
        }
    }
    
    // MARK: Finish program
    @MainActor
    public func finishProgram() {
        UserDefaults.standard.removeObject(forKey: "startDate")
        self.program = nil
        self.startDate = nil
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
