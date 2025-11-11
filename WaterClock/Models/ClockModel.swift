//
//  ClockModel.swift
//  WaterClock
//
//  Created by iOS Developer on 09/10/25.
//

import Foundation
import SwiftUI

struct ClockModel: Identifiable{
    let id: UUID
    let day: String
    let liters: Double
    let price: Double
    let color: Color 
}
