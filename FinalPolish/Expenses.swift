//
//  Expenses.swift
//  FinalPolish
//
//  Created by Davin Henrik on 4/10/23.
//

import Foundation

// Stores an array of expense items in a single object.

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        // 1.
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // 2. & 3.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // 4.
                items = decodedItems
                return
            }
        }
        // 5.
        items = []
    }
}

