//
//  WeatherViewModel.swift
//  weather-app-ios
//
//  Created by Rick Brown on 08/01/2021.
//

import SwiftUI

struct WeatherViewModel {
  var weatherResponse: Weather = Bundle.main.decode("weather.json")
}
