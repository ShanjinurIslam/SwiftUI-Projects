//
//  IncomeDetailView.swift
//  Income Tax Calculator
//
//  Created by Shanjinur Islam on 8/6/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct IncomeDetailView: View {
    @EnvironmentObject var userData:UserData
    @State var isEditing:Bool = false
    
    
    
    
    
    var body: some View {
        Form{
            Section(header: Text("বার্ষিক কর্মসংস্থান আয়")){
                TextField("৳",text: self.$userData.employmentIncome,onEditingChanged: {_ in
                    self.isEditing = true
                }).keyboardType(.decimalPad)
            }
            
            Section(header: Text("বার্ষিক স্ব-কর্মসংস্থান আয়")){
                TextField("৳",text: self.$userData.selfEmploymentIncome,onEditingChanged: {_ in
                    self.isEditing = true
                }).keyboardType(.decimalPad)
            }
            
            Section(header:Text("মোট আয়")) {
                Text("৳"+String(self.userData.totalIncome))
            }
            Section(header:Text("আয়কর")) {
                Text("৳"+String(self.userData.taxAmount)).bold().font(.headline)
            }
 
        }
        .navigationBarTitle("আয়ের বিবরণ")
        .onAppear(perform: userData.clean)
    }
}

struct IncomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeDetailView()
    }
}
