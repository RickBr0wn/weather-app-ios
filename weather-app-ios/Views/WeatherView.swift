//
//  ContentView.swift
//  weather-app-ios
//
//  Created by Rick Brown on 21/11/2020.
//

/**
 MVVM
 Model
 View
 ViewModel
*/

import SwiftUI

struct WeatherView: View {
  var weatherResponse: Weather = Bundle.main.decode("weather.json")
  
  var body: some View {
    VStack {
      VStack {
        Text(String(weatherResponse.lat))
        
        Text(String(weatherResponse.lon))
      }
    }
  }
}

struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView()
  }
}
