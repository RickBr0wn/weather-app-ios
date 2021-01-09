//
//  EmojiView.swift
//  weather-app-ios
//
//  Created by Rick Brown on 09/01/2021.
//

import SwiftUI

struct EmojiView: View {
  var emoji: String
  
  var body: some View {
    Text(emoji)
      .font(.title)
  }
}

struct EmojiView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiView(emoji: "👻")
  }
}
