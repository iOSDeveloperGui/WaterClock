//
//  HomeView.swift
//  WaterClock
//
//  Created by iOS Developer on 11/10/25.
//

import Foundation
import SwiftUI

struct HomeView: View{
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @State private var showChart: Bool = false
    @State private var loading: Bool = false
    
    var body: some View{
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20){
                    
                    FeatureCarouselComponent()
                    
                    Divider()
                        
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Recently usage")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                if loading{
                                    ProgressView()
                                } else{
                                    ForEach(viewModel.data){ clock in
                                        MetricTitleComponent(clock: clock)
                                            .frame(width: 230)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack(alignment: .center){
                            Text("View Detailed Report")
                            
                            Image(systemName: "chart.bar.xaxis")
                        }
                        .frame(width: 300)
                        .padding()
                        .background(Color.splashBlue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    })
                    
                    .navigationTitle("Water Usage ⏱️")
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                
                
                
                
            }
            
        }
        .onAppear{
            Task{
                loading = true
                await viewModel.loadData()
                loading = false
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel(service: Service(dataService: DataService())))
       // .preferredColorScheme(.dark)
        
}

