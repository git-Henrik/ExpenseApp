//
//  ContentView.swift
//  FinalPolish
//
//  Created by Davin Henrik on 4/10/23.
//
// Goal: Create a list that creates and deletes individual items.

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("ExpenseTracker")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
