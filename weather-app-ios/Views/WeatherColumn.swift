//
//  WeatherColumn.swift
//  weather-app-ios
//
//  Created by Rick Brown on 09/01/2021.
//

import SwiftUI

struct WeatherColumn: View {
  var day: String
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Spacer()
      Text(day.uppercased())
      ForEach(0..<6) { index in
        EmojiView(emoji: "🌤")
      }
      Spacer()
    }
    .padding()
    .frame(maxHeight: 350)
    .background(RoundedRectangle(cornerRadius: .infinity)
                  .stroke())
    
  }
}

struct WeatherColumn_Previews: PreviewProvider {
  static var previews: some View {
    WeatherColumn(day: "mon")
  }
}
