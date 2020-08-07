//
//  ContentView.swift
//  iExpence
//
//  Created by Shanjinur Islam on 8/7/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI
/*
struct ContentView: View {
    
    @ObservedObject var userData:User = User()
    @State var present:Bool = false
    
    var body: some View {
        VStack{
            Text("\(self.userData.firstName) \(self.userData.lastName)")
            
            TextField("Enter First Name",text: self.$userData.firstName)
            TextField("Enter Last Name",text: self.$userData.lastName)
            
            Button("Show Sheet") {
                self.present = true
            }
        }.padding()
            .sheet(isPresented: self.$present,onDismiss: {
                self.present = false
            }){
                SecondView()
        }
    }
}*/

/*
struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }.onDelete(perform: removeRows(at:))
                }

                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }.navigationBarItems(leading: EditButton())
        }
    }
}*/

struct ContentView:View{
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View{
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    NavigationLink(destination:SecondView(expenseItem: item)){
                        Text(item.name)
                    }
                }.onDelete(perform: removeRows(at:))
            }
            .navigationBarItems(leading:
                Button(action: {
                    self.showingAddExpense.toggle()
                }) {
                    Image(systemName: "plus")
                }
            ,trailing: EditButton())
            .navigationBarTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses:self.expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
