//
//  MainCoordinatorView.swift
//  WaterClock
//
//  Created by iOS Developer on 17/11/25.
//

import SwiftUI

struct MainCoordinatorView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        switch appState.currentScreen {
        
        case .splashView:
            SplashView()
            
        case .homeView:
            HomeView()
                .environmentObject(appState)
        case .chartView:
            ChartView()
        }
    }
}

#Preview {
    MainCoordinatorView()
        .environmentObject(AppState(serviceData: Service(dataService: DataService())))
}
