//
//  SelectExperienceView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct SelectExperienceView: View {
    @Binding var selectCategory: CategoryString?
    var onSelect: ((String) -> Void)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("How experienced are you with running and lifting?")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 20) {
                    SelectListRow(
                        text: "Beginner",
                        subtext: "You're just getting into running and lifting.",
                        selection: .constant("")
                    ) {
                        onSelect("Beginner")
                    }
                    
                    SelectListRow(
                        text: "Intermediate",
                        subtext: "You've run a half marathon and regularly lifted a couple times a week.",
                        selection: .constant("")
                    ) {
                        onSelect("Intermediate")
                    }
                    
                    SelectListRow(
                        text: "Advanced",
                        subtext: "You've run a marathon and regularly lifted 3+ times a week.",
                        selection: .constant("")
                    ) {
                        onSelect("Advanced")
                    }
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .background(Color.ColorSystem.systemBackground)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectCategory = nil
                    } label: {
                        Text("Cancel")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectCategory = nil
                    } label: {
                        Text("Done")
                            .font(Font.FontStyles.body)
                            .foregroundStyle(Color.ColorSystem.primaryText)
                    }
                }
            }
        }
    }
}

#Preview {
    SelectExperienceView(selectCategory: .constant(CategoryString(id: 1, string: "Test")), onSelect: {_ in})
}
