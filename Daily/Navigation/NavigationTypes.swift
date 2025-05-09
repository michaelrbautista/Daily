//
//  NavigationTypes.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

// MARK: Screen
enum Screen: Identifiable, Hashable {
    // Onboarding
    case LandingPageView
    case ExperienceView
    case GoalView(viewModel: OnboardingViewModel)
    case PredictorView(viewModel: OnboardingViewModel)
    case DaysPerWeekView(viewModel: OnboardingViewModel)
    case LongRunDayView(viewModel: OnboardingViewModel)
    case MileTimeView(viewModel: OnboardingViewModel)
    case CreatingProgramView(viewModel: OnboardingViewModel)
    case ConsistentlyGoodView(viewModel: OnboardingViewModel)
    case DailyHelpsView(viewModel: OnboardingViewModel)
    
    // Auth
    case SignInView
    case CreateAccountView(viewModel: OnboardingViewModel)
    case AddEmailView(viewModel: OnboardingViewModel)
    case OneTimeCodeView(viewModel: OnboardingViewModel, isSignIn: Bool)
    
    // Training
    case TrainingView
    
    // Year
    case YearView
    
    // Run
    case RunDetailView(viewModel: RunDetailViewModel, date: String)
    
    // Settings
    case SettingsView
    
    // New
    case NewProgramView
    case NewlyCreatedProgramView(viewModel: NewProgramViewModel)
    case ProgramWeekDetailView(shouldUseSheetNavigation: Bool, week: ProgramWeek)
    case ProgramRunDetailView(day: String, week: String, run: ProgramRun)
    
    // Program
    case CurrentProgramView(program: Program)
    
    var id: Self { return self }
}

extension Screen {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .OneTimeCodeView:
            hasher.combine("OneTimeCodeView")
        default:
            break
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.OneTimeCodeView, .OneTimeCodeView):
            return true
        default:
            return true
        }
    }
}

// MARK: Sheet
enum Sheet: Identifiable, Hashable {
    
    case ShareView
    case SavePhotoView
    
    case NewProgramCoordinatorView
    
    var id: Self { return self }
    
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .ShareView:
            hasher.combine("ShareView")
        default:
            hasher.combine("DefaultView")
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Sheet, rhs: Sheet) -> Bool {
        switch (lhs, rhs) {
        default:
            return true
        }
    }
}

// MARK: Full screen cover
enum FullScreenCover: Identifiable, Hashable {
    
    case ShareView
    
    var id: Self { return self }
}

extension FullScreenCover {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .ShareView:
            hasher.combine("ShareView")
        }
    }
    
    // Conform to Equatable
    static func == (lhs: FullScreenCover, rhs: FullScreenCover) -> Bool {
        switch (lhs, rhs) {
        case (.ShareView, .ShareView):
            return true
        }
    }
}
