//
//  WeatherViewModel.swift
//  weatherSwiftUII
//
//  Created by as on 6/15/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import Foundation
import Combine
class WeatherViewModel : ObservableObject{
    
    @Published var weather = Weather()
    
    private var weatherservice : WeatherSerVice!
    
    init() {
        self.weatherservice = WeatherSerVice()
    }
    
    var temperature : String{
        if let temp = self.weather.temp{
            return String(format:"%.0f",temp)
        }
        else{
            return ""
        }
    }
    
    var cityname : String = ""
    
    func search (){
        
        if let city = self.cityname.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city : String){
        self.weatherservice.getWeather(from: city) { weather in
            if let weatherData = weather{
                DispatchQueue.main.async{
                
                self.weather = weatherData
                
                }
            }
        }
    }
}
