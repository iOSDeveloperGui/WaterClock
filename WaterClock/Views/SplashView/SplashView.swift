//
//  WaterClockSplashView.swift
//  WaterClock
//
//  Created by iOS Developer on 02/10/25.
//

import Foundation
import SwiftUI

struct SplashView: View{
    @State private var isActive: Bool = false
    @State private var animated: Bool = false
    @State private var showHome: Bool = false
    
    var body: some View{
        ZStack{
            Color.bgHome.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .scaleEffect(animated ? 1.0 : 0.5)
                    .opacity(animated ? 1.0 : 0.2)
                    .onAppear { withAnimation(.bouncy(duration: 1.5)) { animated = true } }
                
                ProgressView()
                    .tint(Color.black)
                    
            }
        }
        .onAppear{
            Task{
                do{
                    try await Task.sleep(nanoseconds: 1 * 3_000_000_000)
                    withAnimation { isActive = true }
                } catch{
                    print("Splash View task cancelled or error: \(error.localizedDescription)")
                }
            }
        }
        .sheet(isPresented: $isActive){
            SheetInfoView()
                .presentationDetents([.large])
                .interactiveDismissDisabled(true)
                .presentationDragIndicator(.hidden)
            
        }
    }
    
}

#Preview {
    SplashView()
}
