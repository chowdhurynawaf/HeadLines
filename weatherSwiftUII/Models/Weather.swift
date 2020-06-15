//
//  Weather.swift
//  weatherSwiftUII
//
//  Created by as on 6/15/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import Foundation

struct Weather : Decodable{
    var temp : Double?
}

struct WeatherResponse : Decodable {
    var main : Weather
}
