//
//  DataService.swift
//  WaterClock
//
//  Created by iOS Developer on 05/10/25.
//

import Foundation
import SwiftUI

protocol DataServiceProtocol{
    func fetchWeeklyData() async throws -> [ClockModel]
}

class DataService: DataServiceProtocol{
    
    func fetchWeeklyData() async throws -> [ClockModel] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        let pricePerLiter: Double = 0.012
        
        
        let mockData: [ClockModel] = [
            ClockModel(id: UUID(), day: "Mon", liters: 42, price: 42 * pricePerLiter, color: .green),
            ClockModel(id: UUID(), day: "Tue", liters: 37, price: 37 * pricePerLiter, color: .green),
            ClockModel(id: UUID(), day: "Wed", liters: 51, price: 51 * pricePerLiter, color: .red),
            ClockModel(id: UUID(), day: "Thu", liters: 45, price: 45 * pricePerLiter, color: .orange),
            ClockModel(id: UUID(), day: "Fri", liters: 49, price: 49 * pricePerLiter, color: .orange),
            ClockModel(id: UUID(), day: "Sat", liters: 53, price: 53 * pricePerLiter, color: .red),
            ClockModel(id: UUID(), day: "Sun", liters: 39, price: 39 * pricePerLiter, color: .green)
        ]
        
        return mockData
    }
}
    
   
    
    
    /*
    let decoder = JSONDecoder()
    
    func fetchData() async throws -> [ClockModel] {
        guard let url = URL(string: "") else{
            throw ApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw ApiError.networkError
        }
        do{
            let result = try decoder.decode([ClockModel].self, from: data)
            return result
        }
    }
     */
