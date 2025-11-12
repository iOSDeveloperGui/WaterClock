//
//  SheetInfoView.swift
//  WaterClock
//
//  Created by iOS Developer on 04/10/25.
//

import Foundation
import SwiftUI

struct SheetInfoView: View{
    //MARK: - Binding
    @Binding var showHome: Bool
    
    //MARK: - Body
    var body: some View{
        VStack(spacing: 32){
        
            Text("Welcome to Clock Water")
                .foregroundStyle(.primary)
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.all, 12)
                .padding(.horizontal, 36)
                

            VStack(alignment: .leading, spacing: 32){
                InfoSheetViewComponent(
                    image: "drop",
                    title: "Track Your Water Usage",
                    description: "Easily monitor your daily, weekly, and monthly water consumption with real-time updates."
                )
                
                InfoSheetViewComponent(
                    image: "clock",
                    title: "Smart Notifications",
                    description: "Get alerts when you're reaching your daily limit to build better water-saving habits."
                )
                
                InfoSheetViewComponent(
                    image: "leaf",
                    title: "View Your Savings",
                    description: "See your estimated monthly savings on your water bill and your environmental impact in real-time."
                )
            }
            .padding(.horizontal, 16)
            
            
            
            
            
            
            Button(action: {
                showHome = true
            }, label: {
                Text("Let's get started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 332, height: 50)
                    .background(Color.splashBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 16)
                    .shadow(radius: 2)
            })
            

        }
        
    }
}

#Preview {
    SheetInfoView(showHome: .constant(false))
}
