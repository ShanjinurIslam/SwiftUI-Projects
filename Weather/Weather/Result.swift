//
//  Result.swift
//  Weather
//
//  Created by Shanjinur Islam on 7/26/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI
import URLImage

struct Result: View {
    var location:String
    @ObservedObject var fetchData:FetchData = FetchData()
    
    func onLoad(){
        fetchData.getWeather(location: self.location)
    }
    
    var body: some View {
        VStack(alignment: .center){
            if(fetchData.isLoading){
                ActivityIndicator(shouldAnimate: $fetchData.isLoading)
            }
            else{
                if((fetchData.weather) != nil){
                    VStack(alignment:.leading){
                            HStack{
                                Text(fetchData.weather.name).foregroundColor(Color(.gray).opacity(0.50)).font(.title)
                                Spacer()
                            }
                            .padding(.top,0)
                            .padding(.leading,15)
                            HStack{
                                Text("Lat: "+String(fetchData.weather.coord.lat)).foregroundColor(Color(.gray).opacity(0.25)).font(.headline)
                                Spacer()
                            }
                            .padding(.top,15)
                            .padding(.leading,15)
                            .padding(.bottom,0)
                            HStack{
                                Text("Lon: "+String(fetchData.weather.coord.lon)).foregroundColor(Color(.gray).opacity(0.25)).font(.headline)
                                Spacer()
                            }
                            .padding(.top,0)
                            .padding(.leading,15)
                            .padding(.bottom,15)
                        }
                    URLImage(URL(string: "https://openweathermap.org/img/wn/\(fetchData.weather.weather[0].icon)@2x.png")!,placeholder: {
                        ProgressView($0) { progress in
                            ZStack {
                                if progress > 0.0 {
                                    // The download has started. CircleProgressView displays the progress.
                                    CircleProgressView(progress).stroke(lineWidth: 8.0)
                                }
                                else {
                                    // The download has not yet started. CircleActivityView is animated activity indicator that suits this case.
                                    CircleActivityView().stroke(lineWidth: 50.0)
                                }
                            }
                        }
                            .frame(width: 50.0, height: 50.0)
                    }).frame(width:120,height:120)
                        Text(fetchData.weather.weather[0].description.capitalized).foregroundColor(Color(.gray).opacity(0.60)).font(.title)
                        VStack(alignment:.leading){
                            PropertyRow(imageName: "temp",value: String(fetchData.weather.main.temp))
                            PropertyRow(imageName: "pressure", value: String(fetchData.weather.main.pressure))
                            PropertyRow(imageName: "humidity", value: String(fetchData.weather.main.humidity))
                            PropertyRow(imageName: "wind",value: String(fetchData.weather.wind.speed))
                            
                        }
                        .padding(.leading,150)
                        .padding(.trailing,150)
                    }
                else{
                    EmptyView()
                }
            }
            
        }.onAppear(perform: onLoad)
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(location:"London")
    }
}
