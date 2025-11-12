//
//  MetricTitleComponent.swift
//  WaterClock
//
//  Created by iOS Developer on 11/11/25.
//

import Foundation
import SwiftUI

struct MetricTitleComponent: View{
    let clock: ClockModel
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            
            HStack(spacing: 12){
                Image(systemName:"calendar.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                    .foregroundStyle(clock.color)
                
                Text("Day: \(clock.day)")
                    .font(.title2)
                    .foregroundStyle(.primary)
            }
            
            HStack(spacing: 12){
                Image(systemName: "drop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                    .foregroundStyle(clock.color)
                
                Text("Liters: \(Int(clock.liters))L")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            HStack(spacing: 12){
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                    .foregroundStyle(clock.color)
                
                Text("Price: \(clock.price, specifier: "R$%.2f")")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(clock.color)
            }
                
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(clock.color, lineWidth: 4)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
}

#Preview {
    MetricTitleComponent(clock: ClockModel(id: UUID(), day: "monday", liters: 20.0, price: 35.5, color: Color.primary))
}
