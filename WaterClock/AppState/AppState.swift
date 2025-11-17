//
//  AppState.swift
//  WaterClock
//
//  Created by iOS Developer on 17/11/25.
//

import Foundation

@MainActor
class AppState: ObservableObject{
    
    @Published var currentScreen: ScreenEnum = .splashView
    @Published var showingSheetInfo: Bool = false
    
    private let service: Service
    
    init(serviceData: Service){
        self.service = serviceData
    }
    
    public func showInfo(){
        if case .splashView = currentScreen{
            self.showingSheetInfo = true
        }
    }
    
    public func showHome(){
        if case .homeView = currentScreen{
            self.showingSheetInfo = false 
        }
        currentScreen = .homeView
    }
}
