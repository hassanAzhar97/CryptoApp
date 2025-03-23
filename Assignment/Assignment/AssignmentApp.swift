//
//  AssignmentApp.swift
//  Assignment
//
//  Created by Hassan Azhar on 20/03/2025.
//

import SwiftUI

@main
struct AssignmentApp: App {
        @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                CryptoDashboardView()
            } else {
                OnBoardingView()
            }
        }
    }
}
