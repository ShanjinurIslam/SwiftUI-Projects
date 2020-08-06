//
//  UserData.swift
//  Income Tax Calculator
//
//  Created by Shanjinur Islam on 8/6/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class UserData:ObservableObject{
    @Published var citizenType:Int = 0
    @Published var specialType:Int = 0
    @Published var isParent:Int = 0
    //@Published var taxAmount:Double = 0
    @Published var employmentIncome:String = ""
    @Published var selfEmploymentIncome:String = ""
    
    // algorithm
    
    func clean() {
        employmentIncome = ""
        selfEmploymentIncome = ""
    }
    
    var totalIncome:String  {
        let ei = Double(self.employmentIncome) ?? 0
        let si = Double(self.selfEmploymentIncome) ?? 0
        
        return String(ei+si)
    }
    
    var taxAmount:String{
        
        let amount = Double(totalIncome) ?? 0
        var taxAmount:Double = 0
        var initialAmount:Double = 0
        
        if(citizenType==0){
            if(specialType==0){
                initialAmount = 250000
            }
            else if(specialType==1){
                initialAmount = 300000
            }
            else if(specialType==2){
                initialAmount = 400000
            }
            else{
                initialAmount = 450000
            }
            
            if(isParent==1){
                initialAmount += 50000
            }
            
            if(amount<=initialAmount){
                taxAmount = 0
            }
            else if(amount>initialAmount && amount<=(initialAmount+400000)){
                taxAmount = amount*0.10
            }
            else if(amount>(initialAmount+400000) && amount<=(initialAmount+500000)){
                taxAmount = amount*0.15
            }
            else if(amount>(initialAmount+500000) && amount<=(initialAmount+600000)){
                taxAmount = amount*0.20
            }
            else if(amount>(initialAmount+600000) && amount<=(initialAmount+3000000)){
                taxAmount = amount*0.25
            }
            else{
                taxAmount = amount*0.30
            }
        }
        
        else if(citizenType==1){
            taxAmount = amount*0.30
        }
        else{
            taxAmount = amount*0.45
        }
        
        
        return String(taxAmount)
    }
}
