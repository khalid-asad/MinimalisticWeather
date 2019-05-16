//
//  WeatherViewController.swift
//  Minimalistic Weather
//
//  Created by Khalid Asad on 2019-05-15.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    private var model: WeatherModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = WeatherModel()
        
        let postalCode = "22222"
        let country = "US"
        
        fetchData(postalCode: postalCode, country: country)
    }
}

extension WeatherViewController {
    
    func fetchData(postalCode: String, country: String, _ complete: (() -> Void)? = nil) {
        model.fetchData(postalCode: postalCode, country: country, completion: { [unowned self] status in
            switch status {
            case .success:
                DispatchQueue.main.async {
                    self.configureStackView(items: self.model.stackableItems)
                }
            default:
                break;
            }
        })
    }
}

extension WeatherViewController {
    
    private func configureStackView(items: [WeatherModel.StackableItem]) {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        items.forEach {
            switch $0 {
            case .currentWeather(let weather):
                self.addCurrentWeather(currentWeather: weather)
            case .forecastedWeather(let tempHigh, let tempLow):
                self.addForecastedWeather(tempHigh: tempHigh, tempLow: tempLow)
            }
        }
    }
    
    private func addCurrentWeather(currentWeather: Double) {
        #warning("Check settings for celsius or fahrenheit")
        // add current weather
    }
    
    private func addForecastedWeather(tempHigh: [Double], tempLow: [Double]) {
        #warning("Check settings for 7 days or 14 days")
        let sequence = zip(tempHigh, tempLow)
        for (high, low) in sequence {
            addForecastedWeatherRows(tempHigh: high, tempLow: low)
        }
    }
    
    private func addForecastedWeatherRows(tempHigh: Double, tempLow: Double) {
        // add row view
    }
}
