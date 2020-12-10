//
//  weather_app_iosApp.swift
//  weather-app-ios
//
//  Created by Rick Brown on 21/11/2020.
//

import SwiftUI

@main
struct weather_app_ios: App {
  var body: some Scene {
    WindowGroup {
      let weatherService = WeatherService()
      let viewModel = WeatherViewModel(weatherService: weatherService)
      
      WeatherView(viewModel: viewModel)
    }
  }
}
