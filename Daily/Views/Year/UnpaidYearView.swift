//
//  UnpaidYearView.swift
//  Daily
//
//  Created by Michael Bautista on 4/15/25.
//

import SwiftUI
import SuperwallKit

struct UnpaidYearView: View {
    var body: some View {
        ZStack {
            List {
                Section {
                    VStack(spacing: 10) {
                        HStack {
                            Text("🏃‍♂️")
                            Text("0 runs")
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.ColorSystem.systemGray6)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        HStack {
                            Text("🛣️")
                            Text("0 miles")
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.ColorSystem.systemGray6)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .listRowSeparator(.hidden)
                } header: {
                    Text("This year")
                        .font(Font.FontStyles.title2)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
                .headerProminence(.increased)
                
                Section {
                    UnpaidYearGraphView()
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(String(Calendar.current.component(.year, from: Date())))
            
            ZStack {
                Color.ColorSystem.systemBackground
                    .ignoresSafeArea(.all)
                    .opacity(0.8)
                
                StyledButton(variant: .primary, text: "Upgrade to pro", isLoading: .constant(false)) {
                    Superwall.shared.register(placement: "campaign_trigger")
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        
    }
}

#Preview {
    UnpaidYearView()
}
