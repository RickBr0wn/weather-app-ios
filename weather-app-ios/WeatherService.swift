//
//  WeatherService.swift
//  weather-app-ios
//
//  Created by Rick Brown on 25/11/2020.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject {
  private let locationManager = CLLocationManager()
  private let API_KEY = "66fdeb0911c246ff1747e4068e57b697"
  private var completionHandler: ((Weather) -> Void)?
  
  public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)) {
    self.completionHandler = completionHandler
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  private func makeDataRequest(forCoodinates coordinates: CLLocationCoordinate2D) {
    guard let urlString = "api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
      return
    }
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil, let data = data else { return }
      
      if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
        self.completionHandler?(Weather(response: response))
      }
    }
    .resume()
  }
}

extension WeatherService: CLLocationManagerDelegate {
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    makeDataRequest(forCoodinates: location.coordinate)
  }
  
  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Something went wrong: \(error.localizedDescription)")
  }
}

struct APIResponse: Decodable {
  let name: String
  let main: APIMain
  let weather: [APIWeather]
}

struct APIMain: Decodable {
  let temp: Double
}

struct APIWeather: Decodable {
  let description: String
  let iconName: String
  
  enum CodingKeys: String, CodingKey {
    case description
    case iconName = "main"
  }
}
