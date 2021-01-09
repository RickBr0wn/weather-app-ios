//
//  WeatherRow.swift
//  weather-app-ios
//
//  Created by Rick Brown on 09/01/2021.
//

import SwiftUI

struct WeatherRow: View {
  var DaysOfTheWeek = ["mon", "tues", "wed", "thurs", "fri", "sat", "sun"]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(0..<7) { index in
          WeatherColumn(day: DaysOfTheWeek[index])
        }
      }
    }
  }
}

struct WeatherRow_Previews: PreviewProvider {
  static var previews: some View {
    WeatherRow()
  }
}
