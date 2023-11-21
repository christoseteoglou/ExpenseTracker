//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import Foundation

// MARK: Expense Model & Sample Data
struct Expense: Identifiable, Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String {
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sampleExpenses: [Expense] = [
    Expense(remark: "Magic Keyboard", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "YellowColor"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "RedColor"),
    Expense(remark: "Magic Trackpad", amount: 99, date: Date(timeIntervalSince1970: 1652382445), type: .expense, color: "PurpleColor"),
    Expense(remark: "Uber Cab", amount: 20, date: Date(timeIntervalSince1970: 1652296045), type: .expense, color: "GreenColor"),
    Expense(remark: "Amazon Purchase", amount: 299, date: Date(timeIntervalSince1970: 1652209645), type: .expense, color: "YellowColor"),
    Expense(remark: "Stocks", amount: 399, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "PurpleColor"),
    Expense(remark: "In App Purchase", amount: 5.99, date: Date(timeIntervalSince1970: 1651864045), type: .income, color: "RedColor"),
    Expense(remark: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .income, color: "YellowColor"),
    Expense(remark: "Apple Music", amount: 25, date: Date(timeIntervalSince1970: 1651518445), type: .income, color: "GreenColor"),
    Expense(remark: "Snacks", amount: 49, date: Date(timeIntervalSince1970: 1651432045), type: .income, color: "PurpleColor"),
]
