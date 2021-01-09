//
//  Weather.swift
//  weather-app-ios
//
//  Created by Rick Brown on 25/11/2020.
//

import Foundation

struct WeatherDescription: Codable {
  var id: Int
  var main: String
  var description: String
  var icon: String
}

struct Current: Codable {
  var dt: Double
  var sunrise: Double
  var sunset: Double
  var temp: Double
  var feelsLike: Double
  var pressure: Double
  var humidity: Double
  var dewPoint: Double
  var uvi: Int
  var clouds: Int
  var visibility: Double
  var windSpeed: Double
  var windDeg: Double
  var weather: [WeatherDescription]
  
  enum CodingKeys: String, CodingKey {
    case dt
    case sunrise
    case sunset
    case temp
    case feelsLike = "feels_like"
    case pressure
    case humidity
    case dewPoint = "dew_point"
    case uvi
    case clouds
    case visibility
    case windSpeed = "wind_speed"
    case windDeg = "wind_deg"
    case weather
  }
}

struct MinuteDescription: Codable {
  var dt: Double
  var precipitation: Int
}

struct HourlyDescription: Codable {
  var dt: Double
  var temp: Double
  var feelsLike: Double
  var pressure: Double
  var humidity: Double
  var dewPoint: Double
  var uvi: Int
  var clouds: Int
  var visibility: Double
  var windSpeed: Double
  var windDeg: Double
  var weather: [WeatherDescription]
  var pop: Double
  
  enum CodingKeys: String, CodingKey {
    case dt
    case temp
    case feelsLike = "feels_like"
    case pressure
    case humidity
    case dewPoint = "dew_point"
    case uvi
    case clouds
    case visibility
    case windSpeed = "wind_speed"
    case windDeg = "wind_deg"
    case weather
    case pop
  }
}

struct Temperature: Codable {
  var day: Double
  var min: Double
  var max: Double
  var night: Double
  var eve: Double
  var morn: Double
}

struct DailyDescription: Codable {
  var dt: Double
  var sunrise: Double
  var sunset: Double
  var temp: Temperature
  var feelsLike: [FeelsLikeDescription]
  var pressure: Double
  var humidity: Double
  var dewPoint: Double
  var windSpeed: Double
  var windDeg: Double
  var weather: [WeatherDescription]
  var clouds: Int
  var pop: Double
  var uvi: Int
  
  enum CodingKeys: String, CodingKey {
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
    case uvi
  }
}

struct FeelsLikeDescription: Codable {
  var day: Double
  var night: Double
  var eve: Double
  var morn: Double
}

struct Alerts: Codable {
  var senderName: String
  var event: String
  var start: Int
  var end: Int
  var description: String
  
  enum CodingKeys: String, CodingKey {
    case senderName = "sender_name"
    case event
    case start
    case end
    case description
  }
}

public struct Weather: Codable {
  var lat: Double
  var lon: Double
  var timezone: String
  var timezoneOffset: Double
  var current: Current
  var minutely: [MinuteDescription]
  var hourly: [HourlyDescription]
  var daily: [DailyDescription]
  var feelsLike: [FeelsLikeDescription]
  var alerts: [Alerts]

  enum CodingKeys: String, CodingKey {
    case lat
    case lon
    case timezone
    case timezoneOffset = "timezone_offset"
    case current
    case minutely
    case hourly
    case daily
    case feelsLike = "feels_like"
    case alerts
  }
}
