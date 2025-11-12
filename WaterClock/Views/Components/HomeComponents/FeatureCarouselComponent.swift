//
//  CardMetricComponent.swift
//  WaterClock
//
//  Created by iOS Developer on 12/11/25.
//

import Foundation
import SwiftUI

struct FeatureCarouselComponent: View{
    @State private var cardIndex: Int = 0
    
    let featureCards: [CardModel] = [
        CardModel(
            title: "Click here to check your bill cost",
            subtitle: "View your estimated monthly expenditure.",
            imageName: "character1",
            backgroundColor: Color.splashBlueLight
        ),
        CardModel(
            title: "Behavioral Alert!",
            subtitle: "You exceeded your daily goal 3 times this week.",
            imageName: "exclamationmark.triangle.fill",
            backgroundColor: Color.red.opacity(0.8)
        ),
        CardModel(
            title: "Your Goal: 40L/Day",
            subtitle: "Keep up the good work to save money!",
            imageName: "chart.bar.fill",
            backgroundColor: Color.green.opacity(0.8)
        )
    ]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            TabView(selection: $cardIndex){
                
                ForEach(featureCards.indices, id: \.self){ index in
                    MainCardComponent(cardModel: featureCards[index])
                        .tag(index)
                        .padding(.horizontal, 20)
                }
                
            }
            .frame(width: 400, height: 400)
            .background(Color.splashBlueLight.opacity(0.4).ignoresSafeArea())
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}
