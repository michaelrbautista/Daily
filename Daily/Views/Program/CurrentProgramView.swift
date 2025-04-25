//
//  CurrentProgramView.swift
//  Daily
//
//  Created by Michael Bautista on 4/25/25.
//

import SwiftUI

struct CurrentProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var presentFinishProgram = false
    
    var program: Program
    
    var body: some View {
        List {
            // MARK: Title/date
            VStack(alignment: .leading) {
                Text("\(program.type.asString) Program")
                    .font(Font.FontStyles.largeTitle)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                Text("\(program.weeks.count) weeks")
                    .font(Font.FontStyles.headline)
                    .foregroundStyle(Color.ColorSystem.systemGray)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.ColorSystem.systemBackground)
            
            // MARK: Program weeks
            ForEach(program.weeks.indices, id: \.self) { index in
                ProgramWeekCell(week: program.weeks[index])
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.ColorSystem.systemBackground)
                    .onTapGesture {
                        navigationController.push(.ProgramWeekDetailView(shouldUseSheetNavigation: false, week: program.weeks[index]))
                    }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
        .toolbar {
            ToolbarItem {
                Button {
                    presentFinishProgram.toggle()
                } label: {
                    Text("Finish")
                }

            }
        }
        .alert(Text("Are you sure you want to finish this program?"), isPresented: $presentFinishProgram) {
            Button(role: .destructive) {
                userViewModel.finishProgram()
                navigationController.popToRoot()
            } label: {
                Text("Yes")
            }
        }
    }
}

#Preview {
    CurrentProgramView(program: Program(type: .BaseTraining, weeks: []))
}
