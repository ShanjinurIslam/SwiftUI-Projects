//
//  PropertyRow.swift
//  Weather
//
//  Created by Shanjinur Islam on 7/27/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct PropertyRow: View {
    var imageName:String
    var value:String
    
    var body: some View {
        HStack(alignment:.top){
            Image(imageName).resizable().frame(width:40,height: 40)
            Spacer()
            Text(value).foregroundColor(Color(.gray).opacity(0.25)).font(.headline)
        }
        .padding(.top,5)
        .padding(.bottom,5)
    }
}
