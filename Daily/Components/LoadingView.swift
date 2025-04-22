//
//  LoadingView.swift
//  Daily
//
//  Created by Michael Bautista on 4/18/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            ProgressView()
                .frame(maxWidth: UIScreen.main.bounds.size.width)
                .tint(Color.ColorSystem.primaryText)
            Spacer()
        }
        .background(Color.ColorSystem.systemBackground)
    }
}

#Preview {
    LoadingView()
}
