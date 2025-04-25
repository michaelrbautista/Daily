//
//  WorkoutDetailCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/17/25.
//

import SwiftUI

struct WorkoutDetailCell: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.FontStyles.callout)
                .foregroundStyle(Color.ColorSystem.systemGray)
            
            Text(subtitle)
                .font(Font.FontStyles.headline)
                .foregroundStyle(Color.ColorSystem.primaryText)
        }
    }
}

#Preview {
    WorkoutDetailCell(title: "Duration", subtitle: "00:59:22")
}
