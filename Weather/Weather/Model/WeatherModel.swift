//
//  WeatherModel.swift
//  Weather
//
//  Created by Shanjinur Islam on 8/2/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

struct Coord:Codable{
    var lon:Double
    var lat:Double
}

struct Desc:Codable{
    var id:Int
    var description:String
    var icon:String
}

struct Temp:Codable{
    var temp:Double
    var feels_like:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Int
    var humidity:Int
}

struct Wind:Codable{
    var speed:Double
}

struct Weather:Codable{
    var name:String
    var coord:Coord
    var weather:[Desc]
    var main:Temp
    var wind:Wind
}
