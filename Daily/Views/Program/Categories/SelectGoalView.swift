//
//  SelectGoalView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct SelectGoalView: View {
    @Binding var selectCategory: CategoryString?
    var onSelect: ((String) -> Void)
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What are you training for?")
                    .font(Font.FontStyles.title2)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 20) {
                    SelectListRow(
                        text: "Base training",
                        selection: .constant("")
                    ) {
                        onSelect("Base training")
                    }
                    
//                    SelectListRow(
//                        text: "10k",
//                        selection: .constant("")
//                    ) {
//                        onSelect("10k")
//                    }
                    
                    SelectListRow(
                        text: "Half marathon",
                        selection: .constant("")
                    ) {
                        onSelect("Half marathon")
                    }
                    
                    SelectListRow(
                        text: "Marathon",
                        selection: .constant("")
                    ) {
                        onSelect("Marathon")
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
    SelectGoalView(selectCategory: .constant(CategoryString(id: 1, string: "Test")), onSelect: {_ in})
}
