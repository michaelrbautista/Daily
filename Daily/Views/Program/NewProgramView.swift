//
//  NewProgramView.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

import SwiftUI

struct CategoryString: Identifiable {
    var id: Int
    var string: String
}

struct NewProgramView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var sheetNavigationController: SheetNavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var viewModel = NewProgramViewModel()
    
    @State var isLoading = false
    @State var selectCategory: CategoryString?
    
    var body: some View {
        List {
            // MARK: Experience
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 1,
                        string: "Experience"
                    )
                } label: {
                    SelectButton(text: $viewModel.experience)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Experience")
            }
            
            // MARK: Goal
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 2,
                        string: "Goal"
                    )
                } label: {
                    SelectButton(text: $viewModel.goal)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Goal")
            }
            
            // MARK: Long run
            Section {
                Button {
                    selectCategory = CategoryString(
                        id: 5,
                        string: "Long Run"
                    )
                } label: {
                    SelectButton(text: $viewModel.longRunDay)
                }
                .listRowBackground(Color.ColorSystem.systemGray6)
            } header: {
                Text("Long Run")
            }
            
            // MARK: Mile time
            Section {
                VStack(alignment: .leading, spacing: 5) {
                    Text("MILE TIME")
                        .font(Font.FontStyles.footnote)
                        .foregroundStyle(Color.ColorSystem.systemGray)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    
                    HStack(spacing: 5) {
                        TextField("Minutes", text: $viewModel.mileTimeMinutes)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.ColorSystem.systemGray6)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .keyboardType(.numberPad)
                        
                        VStack(spacing: 5) {
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                            
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundStyle(Color.ColorSystem.primaryText)
                        }
                        
                        TextField("Seconds", text: $viewModel.mileTimeSeconds)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.ColorSystem.systemGray6)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .keyboardType(.numberPad)
                    }
                }
                .listRowBackground(Color.ColorSystem.systemBackground)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            
            // MARK: Start date
            Section {
                DatePicker("Select a date", selection: $viewModel.startDate, in: Date()..., displayedComponents: [.date])
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .listRowBackground(Color.ColorSystem.systemGray6)
                    .onChange(of: viewModel.startDate) { oldValue, newValue in
                        if !isMonday(date: newValue) {
                            viewModel.returnedError = true
                            viewModel.startDate = nextMonday(from: newValue)
                        }
                    }
            } header: {
                Text("Start Date")
            }
            
            Text("Your program will be \(viewModel.goal == "Marathon" ? 16 : 12) weeks long and must start on a Monday.")
                .font(Font.FontStyles.body)
                .foregroundStyle(Color.ColorSystem.systemGray)
                .listRowBackground(Color.ColorSystem.systemBackground)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationTitle("New Program")
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.ColorSystem.systemBackground)
        .interactiveDismissDisabled()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navigationController.dismissSheet()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color.ColorSystem.primaryText)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.createGeneralProgram()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        sheetNavigationController.push(.NewlyCreatedProgramView(viewModel: viewModel))
                        viewModel.isCreating = false
                    }
                } label: {
                    if viewModel.isCreating {
                        ProgressView()
                            .tint(Color.ColorSystem.primaryText)
                    } else {
                        Text("Create")
                            .foregroundStyle(
                                viewModel.experience != "" &&
                                viewModel.goal != "" &&
                                viewModel.longRunDay != "" &&
                                viewModel.mileTimeMinutes != "" &&
                                viewModel.mileTimeSeconds != "" ? Color.ColorSystem.systemBlue : Color.ColorSystem.systemGray3
                            )
                    }
                }
                .disabled(
                    viewModel.experience == "" ||
                    viewModel.experience == "" ||
                    viewModel.longRunDay == "" ||
                    viewModel.mileTimeMinutes == "" ||
                    viewModel.mileTimeSeconds == "" ||
                    viewModel.isCreating
                )
            }
        }
        .sheet(item: $selectCategory, content: { category in
            switch category.string {
            case "Experience":
                SelectExperienceView(selectCategory: $selectCategory) { experience in
                    viewModel.experience = experience
                    selectCategory = nil
                }
            case "Goal":
                SelectGoalView(selectCategory: $selectCategory) { goal in
                    viewModel.goal = goal
                    selectCategory = nil
                }
            case "Long Run":
                SelectLongRunDayView(selectCategory: $selectCategory) { day in
                    viewModel.longRunDay = day
                    selectCategory = nil
                }
            default:
                Text("Error")
            }
        })
    }
    
    func isMonday(date: Date) -> Bool {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        return weekday == 2
    }

    func nextMonday(from date: Date) -> Date {
        let calendar = Calendar.current
        var nextDate = date

        while !isMonday(date: nextDate) {
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
        }

        return nextDate
    }
}

#Preview {
    NewProgramView()
}
