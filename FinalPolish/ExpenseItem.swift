//
//  ExpenseItem.swift
//  FinalPolish
//
//  Created by Davin Henrik on 4/10/23.
//

import Foundation

// represent a single item of expense.

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}


