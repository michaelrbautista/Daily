//
//  YearGraphView.swift
//  Daily
//
//  Created by Michael Bautista on 4/11/25.
//

import SwiftUI

struct YearGraphView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: YearViewModel
    
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
        HStack {
            Spacer()
            // Add month labels
            VStack(spacing: 5) {
                // Spacer for day labels
                Text("")
                    .frame(width: 30, height: 30)
                
                ForEach(0..<viewModel.weeks.count, id: \.self) { index in
                    Text(viewModel.months[index])
                        .font(Font.FontStyles.caption2)
                        .foregroundColor(Color.ColorSystem.systemGray)
                        .frame(width: 30, height: 30)
                }
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
                ForEach(viewModel.weeks.indices, id: \.self) { weekIndex in
                    HStack(spacing: 5) {
                        ForEach(viewModel.weeks[weekIndex]) { day in
                            GraphDayCell(day: day)
                        }
                    }
                }
            }
            
            // Add run count labels
            VStack(spacing: 5) {
                // Spacer for day labels
                Text("")
                    .frame(width: 30, height: 30)
                
                ForEach(0..<viewModel.weeks.count, id: \.self) { index in
                    Text("")
                        .font(Font.FontStyles.caption2)
                        .foregroundColor(Color.ColorSystem.systemGray)
                        .frame(width: 30, height: 30)
                }
            }
            
            Spacer()
        }
    }
}

// MARK: Preview
struct YearGraphView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            YearGraphView(viewModel: YearViewModel())
                .previewLayout(.sizeThatFits)
        }
    }
}
