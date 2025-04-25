//
//  RaceDateView.swift
//  Daily
//
//  Created by Michael Bautista on 4/23/25.
//

import SwiftUI

struct RaceDateView: View {
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("When do you want to start your program?")
                .font(Font.FontStyles.title2)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack {
                HStack(spacing: 10) {
                    DatePicker("Select a date date", selection: $viewModel.startDate, in: Date()..., displayedComponents: [.date])
                        .onChange(of: viewModel.startDate) { oldValue, newValue in
                            if !isMonday(date: newValue) {
                                viewModel.returnedError = true
                                viewModel.startDate = nextMonday(from: newValue)
                            }
                        }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Your program will be \(viewModel.goal == "Marathon" ? 16 : 12) weeks long and must start on a Monday.")
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            
            Spacer()
            StyledButton(
                variant: .primary,
                text: "Next",
                isLoading: .constant(false)
            ) {
                navigationController.push(.CreatingProgramView(viewModel: viewModel))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
    
    func isMonday(date: Date) -> Bool {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        return weekday == 2
    }

    func nextMonday(from date: Date) -> Date {
        let calendar = Calendar.current
        var nextDate = date

        while !isMonday(date: nextDate) {
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
        }

        return nextDate
    }
}

#Preview {
    RaceDateView(viewModel: OnboardingViewModel())
}
