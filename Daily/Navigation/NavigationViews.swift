//
//  NavigationViews.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

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
