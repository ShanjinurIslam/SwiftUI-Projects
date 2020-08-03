//
//  ContentView.swift
//  BetterRest
//
//  Created by Shanjinur Islam on 8/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    @State private var coffeeAmount = 1
    @State private var presentSheet = false
    @State private var showingAlert = false
    @State private var idealSleepTime:String = ""
    
    private let alertMessage = "There is a problem in calculation"
    
    
    var model = BetterSleepModel()
    
    func calculateBedtime() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            self.idealSleepTime = formatter.string(from: sleepTime)
            self.presentSheet = true
        } catch {
            self.showingAlert = true
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Desired amount of sleep")){
                    Stepper(value:$sleepAmount,in: 4...12,step: 0.25){
                        Text("\(sleepAmount,specifier: "%0.2f") hours")
                    }
                }
                
                Section(header: Text("Wake Up")){
                    DatePicker("Please enter a date", selection: $wakeUp,displayedComponents: .hourAndMinute).labelsHidden()
                }
                
                Section(header: Text("Coffee Amount")){
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
                
                Button(action:self.calculateBedtime){
                    Text("Calculate")
                }
            }
            .sheet(isPresented: $presentSheet,onDismiss: {
                self.presentSheet = false
            }){
                NavigationView{
                    VStack{
                        Text("\(self.idealSleepTime)").font(.largeTitle).bold()
                    }
                        .navigationBarTitle(Text("Ideal Bedtime"),displayMode: .inline)
                }
            }
            .alert(isPresented:self.$showingAlert){
                Alert(title: Text("Error"),message: Text(self.alertMessage))
            }
            .navigationBarTitle("Better Rest")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
