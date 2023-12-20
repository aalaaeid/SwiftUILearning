//
//  WeatherVM.swift
//  WeatherNow
//
//  Created by Alaa Eid on 20/12/2023.
//

import Foundation

class WeatherVM: ObservableObject {
    
    private var weatherService: WeatherService!
    
    @Published var weather = Main(temp: nil, humidity: nil)
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f",temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
          
          if let humidity = self.weather.humidity {
              return String(format: "%.0f",humidity)
          } else {
              return ""
          }
      }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            print("WOW! \(city)")
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
                
            }
        }
        
    }
    
}
