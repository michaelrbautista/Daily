//
//  SelectButton.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct SelectButton: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            if text == "" {
                Text("Select")
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            } else {
                Text(text)
                    .font(Font.FontStyles.body)
                    .foregroundStyle(Color.ColorSystem.primaryText)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height: 10)
                .foregroundStyle(Color.ColorSystem.systemGray2)
                .fontWeight(.bold)
        }
        .background(Color.ColorSystem.systemGray6)
    }
}

#Preview {
    SelectButton(text: .constant("Test"))
}
