//
//  TrainingDataService.swift
//  Daily
//
//  Created by Michael Bautista on 4/14/25.
//

import Foundation

// Intensity should be the average of:
// 1. Duration
//    0-1 hour = 1
//    1-2 hour = 2
//    2-3 hour = 3
//    3+  hour = 4
// 2. Intensity (TRIMP)
//    0-50    = 1
//    51-100  = 2
//    101-150 = 3
//    151+    = 4

import SwiftUI
import HealthKit

class TrainingDataService {
    
    public static let shared = TrainingDataService()
    
    // MARK: Calculate intensity
    func calculateIntensity(durationMinutes: Double, hrAvg: Double, hrRest: Double, hrMax: Double, isMale: Bool) -> Int {
        let hrRelative = (hrAvg - hrRest) / (hrMax - hrRest)
        let b = isMale ? 1.92 : 1.67
        let trimp = durationMinutes * hrRelative * pow(M_E, b * hrRelative)
        
        if trimp < 101 {
            return 1
        } else if trimp < 201 {
            return 2
        } else if trimp < 301 {
            return 3
        } else {
            return 4
        }
    }
    
}
