//
//  WeatherViewModel.swift
//  weather-app-ios
//
//  Created by Rick Brown on 10/12/2020.
//

import Foundation

private let defaultIcon = "🏠"
private var iconMap = [
  "Drizzle": "🌧",
  "Thunderstorm": "🌩",
  "Snow": "❄️",
  "Clear": "☀️",
  "Clouds": "☁️"
]

public class WeatherViewModel: ObservableObject {
  @Published var cityName: String = "City Name"
  @Published var temperature: String = "--"
  @Published var weatherDescription: String = "--"
  @Published var weatherIcon: String = defaultIcon
  
  public let weatherService: WeatherService
  
  public init(weatherService: WeatherService) {
    self.weatherService = weatherService
  }
  
  public func refresh() {
    weatherService.loadWeatherData { weather in
      DispatchQueue.main.async {
        self.cityName = weather.city
        self.temperature = "\(weather.temperature)°C"
        self.weatherDescription = weather.description.capitalized
        self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
      }
    }
  }
}
