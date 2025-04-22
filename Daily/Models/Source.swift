//
//  Source.swift
//  Daily
//
//  Created by Michael Bautista on 4/10/25.
//

enum Source {
    case HealthKit
    
    var asString: String {
        switch self {
        case .HealthKit:
            return "HealthKit"
        }
    }
}
