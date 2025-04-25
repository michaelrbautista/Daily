//
//  ProgramService.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

class ProgramService {
    
    public static let shared = ProgramService()
    
    public func getProgram(
        experience: String,
        goal: String,
        longRunDay: String
    ) -> Program {
        var newProgram = Program(type: .BaseTraining, weeks: [])
        
        if goal == "Base training" {
            if experience == "Beginner" {
                newProgram.weeks = BeginnerBaseTraining.shared.weeks
            } else if experience == "Intermediate" {
                newProgram.weeks = IntermediateBaseTraining.shared.weeks
            } else {
                newProgram.weeks = AdvancedBaseTraining.shared.weeks
            }
        } else if goal == "10k" {
            newProgram.type = .TenK
            
            if experience == "Beginner" {
                newProgram.weeks = BeginnerTenK.shared.weeks
            } else if experience == "Intermediate" {
                newProgram.weeks = IntermediateTenK.shared.weeks
            } else {
                newProgram.weeks = AdvancedTenK.shared.weeks
            }
        } else if goal == "Half marathon" {
            newProgram.type = .HalfMarathon
            
            if experience == "Beginner" {
                newProgram.weeks = BeginnerHalfMarathon.shared.weeks
            } else if experience == "Intermediate" {
                newProgram.weeks = IntermediateHalfMarathon.shared.weeks
            } else {
                newProgram.weeks = AdvancedHalfMarathon.shared.weeks
            }
        } else {
            newProgram.type = .Marathon
            
            if experience == "Beginner" {
                newProgram.weeks = BeginnerMarathon.shared.weeks
            } else if experience == "Intermediate" {
                newProgram.weeks = IntermediateMarathon.shared.weeks
            } else {
                newProgram.weeks = AdvancedMarathon.shared.weeks
            }
        }
        
        // Adjust long run day
        if longRunDay == "Sunday" {
            for index in 0..<newProgram.weeks.count - 1 {
                // Pop last item and put at beginning of week
                let lastRun = newProgram.weeks[index].runs.popLast()
                if let run = lastRun {
                    newProgram.weeks[index].runs.insert(run, at: 0)
                }
            }
        }
        
        return newProgram
    }
    
}
