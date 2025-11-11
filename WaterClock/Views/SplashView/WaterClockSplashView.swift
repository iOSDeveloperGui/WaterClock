//
//  WaterClockSplashView.swift
//  WaterClock
//
//  Created by iOS Developer on 02/10/25.
//

import Foundation
import SwiftUI

struct WaterClockSplashView: View{
    //MARK: - @State variable
    @State private var isActive: Bool = false
    @State private var animated: Bool = false
    @State private var showHome: Bool = false
    
    var body: some View{
        ZStack{
            if showHome {
                HomeView()
            } else {
                splashBody
            }
        }
    }
    
    //MARK: - Body
    private var splashBody: some View{
        ZStack {
            LinearGradient(colors: [.splashBlue, .secondary], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .scaleEffect(animated ? 1.0 : 0.5)
                    .opacity(animated ? 1.0 : 0.2)
                    .onAppear { withAnimation(.bouncy(duration: 1.5)) { animated = true } }
                
                Text("Water Clock")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .scaleEffect(animated ? 1.0 : 0.5)
                    .onAppear { withAnimation(.bouncy(duration: 1.0)) { animated = true } }
                
                Spacer()
                ProgressView()
                    .frame(width: 300)
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
            SheetInfoView(showHome: $showHome)
                .presentationDetents([.large, .medium])
                .interactiveDismissDisabled(true)
                .presentationDragIndicator(.hidden)
            
        }
        
    }
}

#Preview {
    WaterClockSplashView()
}
