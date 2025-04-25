//
//  NewlyCreatedProgramView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct NewlyCreatedProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel: NewProgramViewModel
    
    var body: some View {
        List {
            if let program = viewModel.newProgram {
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
                            sheetNavigationController.push(.ProgramWeekDetailView(shouldUseSheetNavigation: true, week: program.weeks[index]))
                        }
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.saveNewProgram()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        navigationController.dismissSheet()
                    }
                } label: {
                    if viewModel.isSaving {
                        ProgressView()
                            .tint(Color.ColorSystem.primaryText)
                    } else {
                        Text("Save")
                    }
                }
                .disabled(viewModel.isSaving)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewlyCreatedProgramView(viewModel: NewProgramViewModel())
    }
}
