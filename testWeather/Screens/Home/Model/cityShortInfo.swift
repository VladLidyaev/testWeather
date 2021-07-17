//
//  cityShortInfo.swift
//  testWeather
//
//  Created by Vlad on 17.07.2021.
//

import Foundation

struct cityShortInfo {
    
    var cityName : String
    var temperature : Float
    var icon : String
    
    init(name: String, temp: Float, iconName: String) {
        self.cityName = name
        self.temperature = temp
        self.icon = iconName
    }
}
