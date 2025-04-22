//
//  AuthService.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import Supabase

class AuthService {
    
    public static let shared = AuthService()
    
    // MARK: Create user
    public func createUser(email: String, password: String) async throws {
        do {
            try await SupabaseService.shared.supabase.auth.signUp(
                email: email,
                password: password
            )
        } catch {
            print("Error creating user in auth")
            throw error
        }
    }
}
