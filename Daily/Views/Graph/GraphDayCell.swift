//
//  GraphDayCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/16/25.
//

import SwiftUI

struct GraphDayCell: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    var day: GraphDay
    
    var body: some View {
        Rectangle()
            .fill(color(for: day.intensity))
            .frame(width: 30, height: 30)
            .cornerRadius(5)
            .overlay(
                Calendar.current.isDate(Date.now, inSameDayAs: day.date) ? RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.ColorSystem.primaryText, lineWidth: 1) : nil
            )
            .onTapGesture {
                let formatter = DateFormatter()
                formatter.dateFormat = "E, MMM d"
                let formattedString = formatter.string(from: day.date)
                
                if day.intensity > 0 {
                    navigationController.push(.RunDetailView(
                        viewModel: RunDetailViewModel(
                            run: day.workouts[0],
                            restingHeartRate: userViewModel.restingHeartRate,
                            maxHeartRate: userViewModel.maxHeartRate,
                            isMale: UserService.currentUser?.gender == "Male"
                        ),
                        date: formattedString)
                    )
                }
            }
    }
    
    func color(for intensity: Int) -> Color {
        switch intensity {
        case 1:
            return Color.ColorSystem.graphGreen1
        case 2:
            return Color.ColorSystem.graphGreen2
        case 3:
            return Color.ColorSystem.graphGreen3
        case 4:
            return Color.ColorSystem.graphGreen4
        default: return Color.ColorSystem.systemGray6
        }
    }
}

#Preview {
    GraphDayCell(day: GraphDay(date: Date.now, intensity: 1, workouts: []))
}
