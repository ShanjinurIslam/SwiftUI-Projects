//
//  SecondView.swift
//  iExpence
//
//  Created by Shanjinur Islam on 8/7/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var expenseItem:ExpenseItem
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                VStack(alignment:.leading){
                    Text(self.expenseItem.type).padding()
                    Text(String(self.expenseItem.amount)).padding()
                }.padding()
                Spacer()
            }
            Spacer()
        }
        .navigationBarTitle(expenseItem.name)
    }
}
