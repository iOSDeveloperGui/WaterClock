//
//  CardModel .swift
//  WaterClock
//
//  Created by iOS Developer on 12/11/25.
//

import Foundation
import SwiftUI

struct CardModel: Identifiable{
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let backgroundColor: Color
}
