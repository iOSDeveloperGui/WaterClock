//
//  MainCardComponent.swift
//  WaterClock
//
//  Created by iOS Developer on 11/11/25.
//

import Foundation
import SwiftUI

struct MainCardComponent: View{
    let cardModel: CardModel
        
    var body: some View{
        Button(action: {
            print("Checking bill cost...")
        }, label: {
            VStack(spacing: 0){
                VStack(spacing: 8){
                    Image(cardModel.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    
                    Text(cardModel.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(cardModel.backgroundColor)
                
                Text(cardModel.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(cardModel.backgroundColor)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
            }
            .padding(.horizontal, 20)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)

        })
        .buttonStyle(.plain)
    }
}

#Preview {
    MainCardComponent(cardModel: CardModel(title: "", subtitle: "", imageName: "", backgroundColor: Color.splashBlueLight))
}
