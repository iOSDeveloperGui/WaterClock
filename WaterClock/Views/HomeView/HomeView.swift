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
    
    @State private var showChart = false
    @State private var loading = false
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 8){
                Form{
                    Section(header: Text("Recently usage")){
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(viewModel.data){ clock in
                                    MetricTitleComponent(clock: clock)
                                        .padding(.horizontal, 16)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Water Usage ⏱️")
        }
        .onAppear{
            Task{
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel(service: Service(dataService: DataService())))
        .preferredColorScheme(.dark)
        
}

