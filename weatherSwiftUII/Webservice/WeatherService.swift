//
//  WeatherService.swift
//  weatherSwiftUII
//
//  Created by as on 6/15/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import Foundation

class WeatherSerVice {

    func getWeather(from city: String , completion : @escaping (Weather?)->()){
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=e1a5bc43ba74c4e01acc53fff3aa3a40")
    else{
        completion(nil)
        return
        
        }
        
        
        URLSession.shared.dataTask(with: url){data , response, error in
            guard let data = data , error == nil else{
                completion(nil)
                return}
            let responseData = try? JSONDecoder().decode(WeatherResponse.self,from:data)
            if let weatherresponse =  responseData{
                let weather = weatherresponse.main
                completion(weather)
            }else{
                completion(nil)
            }
            
            
        }.resume()
}
}
