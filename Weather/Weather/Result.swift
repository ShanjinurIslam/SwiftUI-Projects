//
//  Result.swift
//  Weather
//
//  Created by Shanjinur Islam on 7/26/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct Result: View {
    var location:String
    
    var body: some View {
        VStack(alignment: .center){
            VStack(alignment:.leading){
                HStack{
                    Text(location).foregroundColor(Color(.gray).opacity(0.50)).font(.title)
                    Spacer()
                }
                .padding(.top,0)
                .padding(.leading,15)
                HStack{
                    Text("Lat").foregroundColor(Color(.gray).opacity(0.25)).font(.headline)
                    Spacer()
                }
                .padding(.top,15)
                .padding(.leading,15)
                .padding(.bottom,0)
                HStack{
                    Text("Long").foregroundColor(Color(.gray).opacity(0.25)).font(.headline)
                    Spacer()
                }
                .padding(.top,0)
                .padding(.leading,15)
                .padding(.bottom,15)
            }
            Image("logo").resizable().frame(width:120,height:120)
            Text("Cloudy").foregroundColor(Color(.gray).opacity(0.60)).font(.title)
            VStack(alignment:.leading){
                PropertyRow(imageName: "temp",value: "32")
                PropertyRow(imageName: "pressure", value: "1")
                PropertyRow(imageName: "humidity", value:"80%")
                PropertyRow(imageName: "wind",value: "4.5")
            }
            .padding(.leading,150)
            .padding(.trailing,150)
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(location:"London")
    }
}
