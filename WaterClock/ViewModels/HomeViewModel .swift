//
//  HomeViewModel .swift
//  WaterClock
//
//  Created by iOS Developer on 11/10/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject{
    
    @Published var data: [ClockModel] = []
    
    private let service: Service
    
    init(service: Service){
        self.service = service
    }
    
    func loadData() async {
        do{
            data = try await service.fetchData()
        } catch{
            print("Error loading data: \(error)")
        }
    }
}
