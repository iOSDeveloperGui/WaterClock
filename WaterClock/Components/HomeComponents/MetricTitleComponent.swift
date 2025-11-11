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
            Text(clock.day)
                .font(.caption)
                .foregroundStyle(.black)
            
            Text("Liters:\(Int(clock.liters))")
                .font(.title2)
                .fontWeight(.medium)
            
            Text("Price:\(clock.price, specifier: "R$%.2f")")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(clock.color)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(clock.color, lineWidth: 4)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
}

