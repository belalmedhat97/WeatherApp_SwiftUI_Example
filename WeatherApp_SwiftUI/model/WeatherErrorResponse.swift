//
//  WeatherErrorResponse.swift
//  WeatherApp_SwiftUI
//
//  Created by Belal medhat on 11/6/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
struct weatherError:Codable{

var error:errorDetails?

}
struct errorDetails:Codable {
    var code:Int?
    var message:String?
}
       
