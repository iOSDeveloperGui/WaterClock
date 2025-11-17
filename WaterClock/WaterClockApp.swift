//
//  WaterClockApp.swift
//  WaterClock
//
//  Created by iOS Developer on 02/10/25.
//

import SwiftUI

@main
struct WaterClockApp: App {
    @EnvironmentObject private var appState: AppState
    
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView()
                .environmentObject(appState)
                
        }
    }
}
