//
//  FetchData.swift
//  Weather
//
//  Created by Shanjinur Islam on 8/2/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class FetchData:ObservableObject{
    @Published var isLoading:Bool = false
    @Published var weather:Weather!
    
    func getWeather(location:String){
        self.isLoading = true
        
        let l:String = String(describing: location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        let urlString:String = "https://api.openweathermap.org/data/2.5/weather?q=\(l)&appid=067d6e3ec1ff73e774b20200caa39151&units=metric"
        
        print(urlString)
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Weather.self, from: data) {
                    DispatchQueue.main.async {
                        self.weather = decodedResponse
                        self.isLoading = false
                    }
                    return
                }
            }
        }.resume()
        
    }
}
