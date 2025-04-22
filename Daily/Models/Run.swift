//
//  DailySummary.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

import SwiftUI
import HealthKit

struct GraphDay: Identifiable {
    let id = UUID()
    var date: Date
    var intensity: Int
    var workouts: [HKWorkout]
}

struct Run: Hashable {
    var distance: Double
    var duration: String
}

struct ProgramRun {
    // Easy/long run
    var distance: Int?
    
    // Speed workout
    var workoutSegments: [RunSegment]?
}

struct RunSegment {
    var title: String
    var description: String
}

struct Program: Identifiable {
    var id = UUID()
    var weeks: [[ProgramRun]]
}
