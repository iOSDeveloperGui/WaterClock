//
//  Service .swift
//  WaterClock
//
//  Created by iOS Developer on 05/10/25.
//

import Foundation

class Service{
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol){
        self.dataService = dataService
    }
    
    func fetchData() async throws -> [ClockModel]{
        return try await dataService.fetchWeeklyData()
    }
}
