//
//  WeekDayCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct WeekDayCell: View {
    
    var day: String
    var run: ProgramRun
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(day)
                    .font(Font.FontStyles.subhead)
                    .foregroundStyle(Color.ColorSystem.systemGray)
                
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(color(for: run.type))
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                    
                    if run.type == .SpeedWorkout {
                        Text("Speed workout")
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
                        Text("\(run.distance ?? 0) miles")
                            .font(Font.FontStyles.footnote)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height: 12)
                .foregroundStyle(Color.ColorSystem.systemGray2)
                .fontWeight(.bold)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.ColorSystem.systemGray6)
        .clipShape(RoundedRectangle(cornerRadius: 10))
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
    WeekDayCell(day: "Monday", run: ProgramRun(type: .EasyRun, distance: 5))
}
