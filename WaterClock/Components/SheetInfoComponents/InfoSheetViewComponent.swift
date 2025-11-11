//
//  InfoSheetViewComponent.swift
//  WaterClock
//
//  Created by iOS Developer on 04/10/25.
//

import Foundation
import SwiftUI

struct InfoSheetViewComponent: View{
    
    let image: String
    let title: String
    let description: String
    
    
    var body: some View{
        HStack(alignment: .top, spacing: 16){
            Image(systemName: image)
                .font(.title2)
                .foregroundStyle(.splashBlue)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    
            }
            
          
        }
        .padding(.horizontal, 16)
        
    }
}
