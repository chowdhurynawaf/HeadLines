//
//  ContentView.swift
//  weatherSwiftUII
//
//  Created by as on 6/14/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var weatherVM : WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack{
            //print("\(weatherVM.temp)")
            Text("Weather Report")
                .font(.largeTitle)
            .padding()
            
            TextField("enter the city name" , text : self.$weatherVM.cityname){
                self.weatherVM.search()
            }
            
            Text("\(self.weatherVM.temperature)" )
            //print("\(self.weatherVM.temperature)")
            
            Spacer()
            
        }
    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
