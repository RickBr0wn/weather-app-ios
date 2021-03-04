//
//  WeatherResponse.swift
//  weather-app-ios
//
//  Created by Rick Brown on 04/03/2021.
//
import Foundation

struct Forecast: Codable {
  struct Daily: Codable {
    struct Temp: Codable {
      let day: Double
      let min: Double
      let max: Double
      let night: Double
      let eve: Double
      let morn: Double
    }
    
    struct FeelsLike: Codable {
      let day: Double
      let night: Double
      let eve: Double
      let morn: Double
    }
    
    struct Weather: Codable {
      let id: Int
      let main: String
      let description: String
      let icon: String
      var weatherIconURL: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
      }
    }
    
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double
    
    private enum CodingKeys: String, CodingKey {
      case dt
      case sunrise
      case sunset
      case temp
      case feelsLike = "feels_like"
      case pressure
      case humidity
      case dewPoint = "dew_point"
      case windSpeed = "wind_speed"
      case windDeg = "wind_deg"
      case weather
      case clouds
      case pop
      case rain
      case uvi
    }
  }
  
  let lat: Double
  let lon: Double
  let timezone: String
  let timezoneOffset: Int
  let daily: [Daily]
  
  private enum CodingKeys: String, CodingKey {
    case lat
    case lon
    case timezone
    case timezoneOffset = "timezone_offset"
    case daily
  }
}
