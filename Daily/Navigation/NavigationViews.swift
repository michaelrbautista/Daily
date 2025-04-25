//
//  NavigationViews.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

// MARK: Training
struct TrainingCoordinatorView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var navigationController: NavigationController = NavigationController()
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            navigationController.build(.TrainingView)
                .environmentObject(userViewModel)
                .navigationDestination(for: Screen.self) { screen in
                    navigationController.build(screen)
                }
                .sheet(item: $navigationController.sheet) { sheet in
                    navigationController.build(sheet)
                }
                .fullScreenCover(item: $navigationController.fullScreenCover) { fullScreenCover in
                    navigationController.build(fullScreenCover)
                }
        }
        .environmentObject(navigationController)
    }
}

// MARK: Year
struct YearCoordinatorView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var navigationController: NavigationController = NavigationController()
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            navigationController.build(.YearView)
                .environmentObject(userViewModel)
                .navigationDestination(for: Screen.self) { screen in
                    navigationController.build(screen)
                }
                .sheet(item: $navigationController.sheet) { sheet in
                    navigationController.build(sheet)
                }
                .fullScreenCover(item: $navigationController.fullScreenCover) { fullScreenCover in
                    navigationController.build(fullScreenCover)
                }
        }
        .environmentObject(navigationController)
    }
}

// MARK: Settings
struct SettingsCoordinatorView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var navigationController: NavigationController = NavigationController()
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            navigationController.build(.SettingsView)
                .environmentObject(userViewModel)
                .navigationDestination(for: Screen.self) { screen in
                    navigationController.build(screen)
                }
                .sheet(item: $navigationController.sheet) { sheet in
                    navigationController.build(sheet)
                }
                .fullScreenCover(item: $navigationController.fullScreenCover) { fullScreenCover in
                    navigationController.build(fullScreenCover)
                }
        }
        .environmentObject(navigationController)
    }
}

// MARK: New program
struct NewProgramCoordinatorView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var navigationController: NavigationController
    
    @StateObject var sheetNavigationController = SheetNavigationController()
    
    var body: some View {
        NavigationStack(path: $sheetNavigationController.path) {
            sheetNavigationController.build(.NewProgramView)
                .environmentObject(userViewModel)
                .navigationDestination(for: Screen.self) { screen in
                    sheetNavigationController.build(screen)
                }
                .sheet(item: $sheetNavigationController.sheet) { sheet in
                    sheetNavigationController.build(sheet)
                }
                .fullScreenCover(item: $sheetNavigationController.fullScreenCover) { fullScreenCover in
                    sheetNavigationController.build(fullScreenCover)
                }
        }
        .environmentObject(navigationController)
        .environmentObject(sheetNavigationController)
    }
}

// MARK: Landing page
struct LandingPageCoordinatorView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var navigationController: NavigationController = NavigationController()
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            navigationController.build(.LandingPageView)
                .environmentObject(userViewModel)
                .navigationDestination(for: Screen.self) { screen in
                    navigationController.build(screen)
                }
                .sheet(item: $navigationController.sheet) { sheet in
                    navigationController.build(sheet)
                }
                .fullScreenCover(item: $navigationController.fullScreenCover) { fullScreenCover in
                    navigationController.build(fullScreenCover)
                }
        }
        .environmentObject(navigationController)
    }
}
