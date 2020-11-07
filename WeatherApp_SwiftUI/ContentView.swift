//
//  ContentView.swift
//  WeatherApp_SwiftUI
//
//  Created by Belal medhat on 11/5/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image(uiImage: #imageLiteral(resourceName: "background")).resizable()
            WeatherView()
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherView: View {
    @ObservedObject var NetworkManager = Network()
    @State var textinput:String = ""
    var DefaultImage = UIImage(systemName: "")

    var body: some View {
        VStack{
            Text("Weathy").font(.custom("Lobster-Regular", size: 50)).foregroundColor(Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))).offset(x: 0, y: 20)
            if NetworkManager.weatherImage == nil {
                Image(systemName: "")
            }else{
                Image(uiImage: UIImage(data: NetworkManager.weatherImage!)!).resizable().frame(width: 60, height: 60, alignment: .center)
            }
            
            
            weatherDatafield(nameParameter: "Location :", value: NetworkManager.country ?? "")
            weatherDatafield(nameParameter: "Temp °C :", value: "\(NetworkManager.tempC ?? "")" )
            weatherDatafield(nameParameter: "Temp °F :", value: "\(NetworkManager.tempF ?? "")")
            weatherDatafield(nameParameter: "Condition :", value: NetworkManager.condition ?? "")
            
    
            Text("Enter Your Country").foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).font(.custom("Lobster-Regular", size: 20)).bold().padding()
            
            TextField("Enter Country or City", text: $textinput).font(.system(size: 15)).padding().border(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), width: 2).cornerRadius(5).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center).padding()
            Button(action: {

                self.NetworkManager.ApiCaller(country: self.textinput)

            }) {
                Text("Get Weather").font(.custom("Lobster-Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).padding().border(Color(#colorLiteral(red: 0.4549019608, green: 0.5411764706, blue: 0.6156862745, alpha: 1)), width: 5).shadow(radius: 20).background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).cornerRadius(8)
            }
                
            .alert(isPresented: $NetworkManager.Alertshow) { () -> Alert in
                            Alert(title: Text("Error"), message: Text(NetworkManager.WeatherErrorMessege ?? "Try Again"), dismissButton: .default(Text("Ok"),action: {
                                self.NetworkManager.WeatherErrorMessege = nil
                            }))
                           
                        }
        }
    }
}
