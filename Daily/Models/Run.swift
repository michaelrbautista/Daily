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
    var runWorkout: HKWorkout
    var distance: Double
    var duration: String
}

struct Program {
    var type: ProgramType
    var weeks: [ProgramWeek]
}

enum ProgramType {
    case TenK
    case HalfMarathon
    case Marathon
    case BaseTraining
    
    var asString: String {
        switch self {
        case .TenK:
            return "10k"
        case .HalfMarathon:
            return "Half Marathon"
        case .Marathon:
            return "Marathon"
        case .BaseTraining:
            return "Base Training"
        }
    }
}

struct ProgramWeek {
    var id = UUID()
    var week: Int
    var runs: [ProgramRun]
}

struct ProgramRun: Hashable {
    var type: RunType
    
    // Easy/long run
    var distance: Int?
    
    // Speed workout
    var workoutSegments: [RunSegment]?
}

enum RunType {
    case EasyRun
    case SpeedWorkout
    case LongRun
    case Rest
    case Race
}

struct RunSegment: Hashable {
    var title: String
    var description: String
}
