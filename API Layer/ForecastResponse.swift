//
//  ForecastResponse.swift
//  Minimalistic Weather
//
//  Created by Khalid Asad on 2019-05-15.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation

struct ForecastResponse: Codable {
    
    var postalCode: String?
    var country: String?
    var timestamp: String?
    var timestampInit: String?
    var cldCvrMin: Double?
    var cldCvrAvg: Double?
    var cldCvrMax: Double?
    var dewPtMin: Double?
    var dewPtMax: Double?
    var feelsLikeMin: Double?
    var feelsLikeAvg: Double?
    var feelsLikeMax: Double?
    var heatIndexMin: Double?
    var heatIndexAvg: Double?
    var heatIndexMax: Double?
    var mslPresMin: Double?
    var mslPresAvg: Double?
    var mslPresMax: Double?
    var precip: Double?
    var precipProb: Double?
    var radSolarMin: Double?
    var radSolarAvg: Double?
    var radSolarMax: Double?
    var radSolarTot: Double?
    var relHumMin: Double?
    var relHumAvg: Double?
    var relHumMax: Double?
    var sfcPresMin: Double?
    var sfcPresAvg: Double?
    var sfcPresMax: Double?
    var snowfall: Double?
    var snowfallProb: Double?
    var spcHumMin: Double?
    var spcHumAvg: Double?
    var spcHumMax: Double?
    var tempMin: Double?
    var tempAvg: Double?
    var tempMax: Double?
    var windChillMin: Double?
    var windChillAvg: Double?
    var windChillMax: Double?
    var windDirAvg: Double?
    var windDir80mAvg: Double?
    var windDir100mAvg: Double?
    var windSpdMin: Double?
    var windSpdAvg: Double?
    var windSpdMax: Double?
    var windSpd80mMin: Double?
    var windSpd80mAvg: Double?
    var windSpd80mMax: Double?
    var windSpd100mMin: Double?
    var windSpd100mAvg: Double?
    var windSpd100mMax: Double?
    var wetBulbMin: Double?
    var wetBulbAvg: Double?
    var wetBulbMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case postalCode
        case country
        case timestamp
        case timestampInit
        case cldCvrMin
        case cldCvrAvg
        case cldCvrMax
        case dewPtMin
        case dewPtMax
        case feelsLikeMin
        case feelsLikeAvg
        case feelsLikeMax
        case heatIndexMin
        case heatIndexAvg
        case heatIndexMax
        case mslPresMin
        case mslPresAvg
        case mslPresMax
        case precip
        case precipProb
        case radSolarMin
        case radSolarAvg
        case radSolarMax
        case radSolarTot
        case relHumMin
        case relHumAvg
        case relHumMax
        case sfcPresMin
        case sfcPresAvg
        case sfcPresMax
        case snowfall
        case snowfallProb
        case spcHumMin
        case spcHumAvg
        case spcHumMax
        case tempMin
        case tempAvg
        case tempMax
        case windChillMin
        case windChillAvg
        case windChillMax
        case windDirAvg
        case windDir80mAvg
        case windDir100mAvg
        case windSpdMin
        case windSpdAvg
        case windSpdMax
        case windSpd80mMin
        case windSpd80mAvg
        case windSpd80mMax
        case windSpd100mMin
        case windSpd100mAvg
        case windSpd100mMax
        case wetBulbMin
        case wetBulbAvg
        case wetBulbMax
    }
    
    static func fetchData(postalCode: String, country: String, completionHandler: @escaping (ForecastResponse?, Error?) -> Void) {
        #warning("Move this into the cloud")
        let onpointKey = "7135cc546def3536f3a7"
        guard let nasaUrl = URL(string: "https://api.weathersource.com/v1/\(onpointKey)/postal_codes/\(postalCode),\({{country}})/forecast.json") else { return }
        
        URLSession.shared.dataTask(with: nasaUrl) { (data, response, error) in
            guard let data = data else { return }
            print("Data: ")
            print(data)
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(ForecastResponse.self, from: data)
                print(responseData)
                completionHandler(responseData, nil)
            } catch let err {
                print("Err", err)
                completionHandler(nil, error)
            }
            }.resume()
    }
}
