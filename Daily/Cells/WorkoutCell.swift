//
//  WorkoutCell.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct WorkoutCell: View {
    
    let distance: Double
    let duration: String
    
    var body: some View {
        HStack(spacing: 20) {
            Text("🏃‍♂️")
                .font(Font.FontStyles.caption1)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(distance.trimmedString) miles")
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                
                Text(duration)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
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
}

extension Double {
    var trimmedString: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

#Preview {
    WorkoutCell(distance: 6.5, duration: "00:59:22")
}
