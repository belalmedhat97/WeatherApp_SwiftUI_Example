//
//  Network.swift
//  WeatherApp_SwiftUI
//
//  Created by Belal medhat on 11/5/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
class Network:ObservableObject {
    // ++++++ confirm to Observable to observe any change in the class published data ++++++
    @Published var country:String? // publish changes happen to country
    @Published var tempC:String?
    @Published var tempF:String?
    @Published var condition:String?
    @Published var weatherImage:Data?
    @Published var WeatherErrorMessege:String?
    @Published var Alertshow:Bool = false
    //  This Api return weather data for searched country every time you request it
    // http://api.weatherapi.com
    
    
     // MARK: Network Caller
    func ApiCaller(country:String){ // used URLSession for Network requesting and Codable For parsing JSON
            
        // 1 :: create URL
        if let WeatherURL = URL(string: "http://api.weatherapi.com/v1/current.json?key=72c2048f1b514f58bc0173623200511&q=\(country)") {
        
        // 2 :: create URLSession
            let session = URLSession(configuration: .default)
        
        // 3 :: give Sesion Task
            let Weathertask = session.dataTask(with: WeatherURL) { (data, response, error) in
                if error == nil {
                    if let HTTPResponse = response as? HTTPURLResponse {
                        guard HTTPResponse.statusCode == 200 else {
                            if let WeatherDataError = data {
                            do {
                                let WeatherResponseResult = try JSONDecoder().decode(weatherError.self, from: WeatherDataError)
                                DispatchQueue.main.async {
                                    self.WeatherErrorMessege = WeatherResponseResult.error?.message ?? ""
                                    print(self.WeatherErrorMessege ?? "")
                                    self.Alertshow = true
                                    
                                }
                                
                            }catch{
                                print(error)
                            }
                            }
                            return
                        }
                        if let WeatherData = data {
                        do {
                            let WeatherResponseResult = try JSONDecoder().decode(WeatherReponse.self, from: WeatherData)
                            DispatchQueue.main.async {
                                self.country = WeatherResponseResult.location?.country ?? ""
                                self.condition = WeatherResponseResult.current?.condition?.text ?? ""
                                self.tempC = "\(WeatherResponseResult.current?.tempC ?? 0.0)"
                                self.tempF = "\(WeatherResponseResult.current?.tempF ?? 0.0)"
                                if let data = try? Data(contentsOf: URL(string: "http:"+(WeatherResponseResult.current?.condition?.icon ?? ""))!){
                                    self.weatherImage = data

                                }

                            }
                            print(WeatherResponseResult.location?.country ?? "")
                            print(WeatherResponseResult.location?.localtime ?? "")

                            
                            
                        }catch{
                            print(error)
                        }
                        }

                    }
            }
            }
        
        // 4 :: Start Session Task
            Weathertask.resume() // Send the request here
        }
        
    }
  
}
