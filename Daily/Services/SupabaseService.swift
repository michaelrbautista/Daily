//
//  SupabaseService.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import Supabase

final class SupabaseService {
    
    public static let shared = SupabaseService()
    public var supabase: SupabaseClient
    
    init() {
        self.supabase = SupabaseClient(
            supabaseURL: URL(string: "https://jcckuqykgtqhlaqabfvq.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjY2t1cXlrZ3RxaGxhcWFiZnZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQyMjQ1NzksImV4cCI6MjA1OTgwMDU3OX0.Kx_egP2G2Loo-ST1hwA1hagphE5YH0QYV088eFunUBI"
        )
    }
    
}
