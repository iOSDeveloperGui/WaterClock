//
//  ChartView.swift
//  WaterClock
//
//  Created by iOS Developer on 12/10/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    @StateObject var viewModel = HomeViewModel(service: Service(dataService: DataService()))
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Water Usage")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 16){
                        HStack{
                            Text("Activity")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("This Week")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Chart(viewModel.data) { item in
                            BarMark(
                                x: .value("Day", item.day),
                                y: .value("Liters", item.liters)
                            )
                            .foregroundStyle(LinearGradient(
                                colors: [.cyan, .blue],
                                startPoint: .bottom,
                                endPoint: .top
                            ))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .frame(height: 180)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.black))
                    .padding(.horizontal, 16)
                }
                .padding(.vertical)
            }
            
        }
        .task {
            await viewModel.loadData()
        }
    }
}
