//
//  MonthGraphView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct MonthGraphView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: TrainingViewModel
    
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
        HStack {
            Spacer()
            
            // Month label
            VStack {
                Text("")
                    .frame(width: 30, height: 30)
                
                Text(viewModel.currentMonth)
                    .font(Font.FontStyles.caption2)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            
            VStack(alignment: .center, spacing: 5) {
                HStack(spacing: 5) {
                    ForEach(0..<7, id: \.self) { index in
                        Text(days[index])
                            .font(Font.FontStyles.caption2)
                            .foregroundColor(Color.ColorSystem.systemGray)
                            .frame(width: 30, height: 30)
                    }
                }	
                if let weeks = viewModel.weeks {
                    ForEach(weeks.indices, id: \.self) { weekIndex in
                        HStack(spacing: 5) {
                            ForEach(weeks[weekIndex]) { day in
                                GraphDayCell(day: day)
                            }
                        }
                    }
                }
            }
            
            // Run count
            VStack {
                Text("")
                    .frame(width: 30, height: 30)
                
                Text("\(viewModel.runCount)")
                    .font(Font.FontStyles.caption2)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            
            Spacer()
        }
    }
}

struct TooltipGraphView: View {
    let day: GraphDay
    @State private var showTooltip = false

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .contentShape(Rectangle())
            .onTapGesture {
                showTooltip.toggle()
            }
            .popover(isPresented: $showTooltip) {
                VStack(spacing: 8) {
                    Text(day.date, style: .date)
                    Text("\(day.intensity)")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
            }
    }
}

// MARK: Preview
struct MonthGraphView_Previews: PreviewProvider {
    static var previews: some View {
        MonthGraphView(viewModel: TrainingViewModel())
            .previewLayout(.sizeThatFits)
    }
}
