//
//  ApiErrorEnum .swift
//  WaterClock
//
//  Created by iOS Developer on 05/10/25.
//

import Foundation

enum ApiError: Error, LocalizedError{
    case invalidURL
    case networkError
    case decodingError(String)
    
    var errorDescription: String?{
        switch self{
        case .invalidURL:
            return "The URL for the API request was invalid"
        case .networkError:
            return "Network error: "
        case .decodingError(let message):
            return "API error: \(message)"
        }
    }
}
