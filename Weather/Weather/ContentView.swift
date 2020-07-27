//
//  ContentView.swift
//  Weather
//
//  Created by Shanjinur Islam on 7/26/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    @State var location:String = ""
    @State var isEmpty:Bool = false
    @ObservedObject var keyboardResponder:KeyboardResponder = KeyboardResponder()
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                Image("logo").resizable().frame(width:150,height: 150)
                ZStack{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(Color(.gray)
                        .opacity(0.25)).frame(height:60)
                    
                    TextField("Enter Location",text:$location).padding()
                }.padding()
                NavigationLink(destination: Result(location: self.location), isActive: self.$isEmpty){
                    Button(action:{
                        UIApplication.shared.endEditing()
                        if(self.location.count>0){
                            self.isEmpty.toggle()
                        }
                    }){
                        Text("Go").font(.title)
                    }
                }
            }
            .padding(.bottom,keyboardResponder.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
