//
//  WeatherModel.swift
//  Minimalistic Weather
//
//  Created by Khalid Asad on 2019-05-15.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation

final class WeatherModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case currentWeather(weather: Double)
        case forecastedWeather(tempHigh: [Double], tempLow: [Double])
    }
    
    var stackableItems: [WeatherModel.StackableItem] = []
}

extension WeatherModel {
    
    enum FetchInfoState {
        case fetching
        case success
        case failure
    }
    
    func fetchData(postalCode: String, country: String, completion: @escaping ((FetchInfoState) -> Void)) {
        ForecastResponse.fetchData(postalCode: country, country: country, completionHandler: { (data, error) in
            if let error = error {
                print("Error: ")
                print(error)
                completion(.failure)
                return
            }
            guard let data = data else {
                print("Error getting data: result is nil")
                completion(.failure)
                return
            }
            
            if let timestamp = data.timestamp, let tempMin = data.tempMin, let tempAvg = data.tempAvg, let tempMax = data.tempMax, let feelsLikeMin = data.feelsLikeMin, let feelsLikeAvg = data.feelsLikeAvg, let feelsLikeMax = data.feelsLikeMax {
                print(timestamp)
                self.stackableItems.append(.forecastedWeather(tempHigh: [tempMax], tempLow: [tempMin]))
                completion(.success)
                return
            }
        })
    }
}
