//
//  Navigation.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

// MARK: Coordinator protocols
protocol CoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
    func presentSheet(_ sheet: Sheet)
    func dismissSheet()
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
}

// MARK: Navigation controller
class NavigationController: CoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet? = nil
    @Published var fullScreenCover: FullScreenCover? = nil
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    // MARK: - Screen views
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        // Onboarding
        case .LandingPageView:
            LandingPageView()
        case .ExperienceView:
            ExperienceView()
        case .GoalView(let viewModel):
            GoalView(viewModel: viewModel)
        case .PredictorView(let viewModel):
            PredictorView(viewModel: viewModel)
        case .DaysPerWeekView(let viewModel):
            DaysPerWeek(viewModel: viewModel)
        case .LongRunDayView(let viewModel):
            LongRunDay(viewModel: viewModel)
        case .MileTimeView(let viewModel):
            MileTimeView(viewModel: viewModel)
        case .CreatingProgramView(let viewModel):
            CreatingProgramView(viewModel: viewModel)
        case .ConsistentlyGoodView(let viewModel):
            ConsistentlyGoodView(viewModel: viewModel)
        case .DailyHelpsView(let viewModel):
            DailyHelpsView(viewModel: viewModel)
            
        // Auth
        case .SignInView:
            SignInView()
        case .CreateAccountView(let viewModel):
            CreateAccountView(viewModel: viewModel)
        case .AddEmailView(let viewModel):
            AddEmailView(viewModel: viewModel)
        case .OneTimeCodeView(let viewModel, let isSignIn):
            OneTimeCodeView(viewModel: viewModel, isSignIn: isSignIn)
            
        // Training
        case .TrainingView:
            TrainingView()
        
        // Year
        case .YearView:
            YearView()
            
        // Run
        case .RunDetailView(let viewModel, let date):
            RunDetailView(viewModel: viewModel, date: date)
            
        // Program
        case .ProgramWeekDetailView(let shouldUseSheetNavigation, let week):
            ProgramWeekDetailView(shouldUseSheetNavigation: shouldUseSheetNavigation, week: week)
        case .ProgramRunDetailView(let day, let week, let run):
            ProgramRunDetailView(day: day, week: week, run: run)
        case .CurrentProgramView(let program):
            CurrentProgramView(program: program)
            
        // Settings
        case .SettingsView:
            SettingsView()
            
        default:
            Text("There was an error. Please try again later.")
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .ShareView:
            Text("Share view")
        case .SavePhotoView:
            Text("Save photo")
        case .NewProgramCoordinatorView:
            NewProgramCoordinatorView()
        }
    }
    
    // MARK: Fullscreen cover views
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .ShareView:
            Text("Share view")
        }
    }
}

// MARK: Sheet coordinator protocols
protocol SheetCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
    func presentSheet(_ sheet: Sheet)
    func dismissSheet()
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
}

// MARK: Sheet navigation controller
class SheetNavigationController: CoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet? = nil
    @Published var fullScreenCover: FullScreenCover? = nil
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    // MARK: - Screen views
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .NewProgramView:
            NewProgramView()
        case .NewlyCreatedProgramView(let viewModel):
            NewlyCreatedProgramView(viewModel: viewModel)
        case .ProgramWeekDetailView(let shouldUseSheetNavigation, let week):
            ProgramWeekDetailView(shouldUseSheetNavigation: shouldUseSheetNavigation, week: week)
        case .ProgramRunDetailView(let day, let week, let run):
            ProgramRunDetailView(day: day, week: week, run: run)
        default:
            Text("There was an error. Please try again later.")
        }
    }
    
    // MARK: Sheet views
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        default:
            Text("There was an error. Please try again later.")
        }
    }
    
    @ViewBuilder
    func build(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        default:
            Text("There was an error. Please try again later.")
        }
    }
}
