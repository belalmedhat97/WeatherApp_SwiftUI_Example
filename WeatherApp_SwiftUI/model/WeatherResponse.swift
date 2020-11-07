//
//  WeatherResponse.swift
//  WeatherApp_SwiftUI
//
//  Created by Belal medhat on 11/5/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
struct WeatherReponse: Codable {

  enum CodingKeys: String, CodingKey {
    case location
    case current
  }

  var location: Location?
  var current: Current?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    location = try container.decodeIfPresent(Location.self, forKey: .location)
    current = try container.decodeIfPresent(Current.self, forKey: .current)
  }

}

struct Condition: Codable {

  enum CodingKeys: String, CodingKey {
    case text
    case icon
    case code
  }

  var text: String?
  var icon: String?
  var code: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    icon = try container.decodeIfPresent(String.self, forKey: .icon)
    code = try container.decodeIfPresent(Int.self, forKey: .code)
  }

}

struct Current: Codable {

  enum CodingKeys: String, CodingKey {

    case tempF = "temp_f"
    case tempC = "temp_c"
    case condition

  }

 
  var tempF: Double?
  var tempC: Double?

  var condition: Condition?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    tempF = try container.decodeIfPresent(Double.self, forKey: .tempF)
    tempC = try container.decodeIfPresent(Double.self, forKey: .tempC)
  
    condition = try container.decodeIfPresent(Condition.self, forKey: .condition)
  }

}
struct Location: Codable {

  enum CodingKeys: String, CodingKey {
    case localtime

    case country
    case name

  }

  var localtime: String?

  var country: String?
  var name: String?




  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    localtime = try container.decodeIfPresent(String.self, forKey: .localtime)

    country = try container.decodeIfPresent(String.self, forKey: .country)
    name = try container.decodeIfPresent(String.self, forKey: .name)

  }

}
