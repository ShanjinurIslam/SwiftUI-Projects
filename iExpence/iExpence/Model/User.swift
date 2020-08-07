//
//  User.swift
//  iExpence
//
//  Created by Shanjinur Islam on 8/7/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

/*
class User:ObservableObject{
    @Published var firstName:String = "Bilbo"
    @Published var lastName:String = "Baggins"
}*/

class User:Codable{
    var firstName:String
    var lastName:String
}
