
//
//  weatherDatafield.swift
//  WeatherApp_SwiftUI
//
//  Created by Belal medhat on 11/6/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import SwiftUI

struct weatherDatafield: View {
    var nameParameter:String
    var value:String = ""
    var body: some View {
        HStack(alignment: .center,spacing: 10){
            Text(nameParameter).font(.custom("Lobster-Regular", size: 30)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            Text(value).font(.custom("Lobster-Regular", size: 30)).foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))

        }
    }
}

struct weatherDatafield_Previews: PreviewProvider {
    static var previews: some View {
        weatherDatafield(nameParameter: "", value: "").previewLayout(PreviewLayout.fixed(width: 300, height: 30))
    }
}
