//
//  ProgramWeekCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct ProgramWeekCell: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var week: ProgramWeek
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Week \(week.week)")
                .font(Font.FontStyles.headline)
                .foregroundStyle(Color.ColorSystem.systemGray)
            
            VStack {
                ForEach(week.runs.indices, id: \.self) { index in
                    ProgramDayCell(day: days[index], run: week.runs[index])
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.ColorSystem.systemGray6)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ProgramWeekCell(week: ProgramWeek(week: 1, runs: [ProgramRun(type: .EasyRun, distance: 5)]))
}
