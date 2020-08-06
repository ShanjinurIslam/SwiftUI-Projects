//
//  ContentView.swift
//  Income Tax Calculator
//
//  Created by Shanjinur Islam on 8/5/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    @EnvironmentObject private var userData:UserData
    
    private let citizenTypes = ["ব্যক্তি করদাতা","কোম্পানি ব্যতীত অনাবাসী","সিগারেট,বিড়ি,জর্দা,গুলসহ মাদকদ্রব্য প্রস্তুতকারক"]
    private let specialCategories = ["সাধারণ","নারী এবং ৬৫ বছর বা তারও বেশি বয়সী","প্রতিবন্ধী","যুদ্ধাহত"]
    private let yes_no = ["না","হ্যাঁ"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("নাগরিক শ্রেণী")){
                    Picker("Type of people", selection: self.$userData.citizenType) {
                        ForEach(0 ..< citizenTypes.count,id:\.self) {
                            Text("\(self.citizenTypes[$0])")
                        }
                    }.labelsHidden()
                }
                
                if self.userData.citizenType == 0 {
                    Section(header:Text("নাগরিক প্রকার")){
                        Picker("Number of people", selection: self.$userData.specialType) {
                            ForEach(0 ..< specialCategories.count,id:\.self) {
                                Text("\(self.specialCategories[$0])")
                            }
                        }.labelsHidden()
                    }
                    
                    Section(header: Text("প্রতিবন্ধী ব্যক্তির পিতামাতা বা অভিভাবক")){
                        Picker("",selection:self.$userData.isParent){
                            ForEach(0 ..< yes_no.count,id:\.self) {
                                Text("\(self.yes_no[$0])")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                NavigationLink(destination:IncomeDetailView().environmentObject(userData)){
                    Text("পরবর্তী")
                }
            }
            .animation(.default)
            .navigationBarTitle("নাগরিক বিবরণ")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
