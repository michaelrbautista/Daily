//
//  ProgramDayCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct ProgramDayCell: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var day: String
    var run: ProgramRun
    
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .fill(color(for: run.type))
                .frame(width: 30, height: 30)
                .cornerRadius(5)
            
            if run.type == .SpeedWorkout {
                Text("\(day) - Speed workout")
                    .font(Font.FontStyles.footnote)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            } else if run.type == .Rest {
                Text("\(day) - Rest or active recovery")
                    .font(Font.FontStyles.footnote)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            } else if run.type == .Race {
                Text("\(day) - Race day")
                    .font(Font.FontStyles.footnote)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            } else {
                Text("\(day) - \(run.distance ?? 0) miles")
                    .font(Font.FontStyles.footnote)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            }
            
            Spacer()
        }
    }
    
    func color(for runType: RunType) -> Color {
        switch runType {
        case .Rest:
            return Color.ColorSystem.graphGreen1
        case .EasyRun:
            return Color.ColorSystem.graphGreen1
        case .SpeedWorkout:
            return Color.ColorSystem.graphGreen3
        case .LongRun:
            return Color.ColorSystem.graphGreen4
        case .Race:
            return Color.ColorSystem.graphGreen4
        }
    }
}

#Preview {
    ProgramDayCell(day: "Monday", run: ProgramRun(type: .EasyRun, distance: 5))
}
