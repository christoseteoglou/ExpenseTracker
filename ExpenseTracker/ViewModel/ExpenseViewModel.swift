//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject {
    // MARK: Properties
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthStartDate: Date = Date()
    
    // MARK: Expense/ Income Tab
    @Published var tabName: ExpenseType = .expense
    // MARK: Filter View
    @Published var showFilterView: Bool = false
    
    // MARK: New Expense Properties
    @Published var addNewExpense: Bool = false
    @Published var amount: String = ""
    @Published var type: ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""
    
    init() {
        // MARK: Fetching Current Month Starting Date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
    }
    
    @Published var expenses: [Expense] = sampleExpenses
    
    // MARK: Fetching Current Month Date String
    func currentMonthDateString() -> String {
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " +
        Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    func convertExpensesToCurrency(expenses: [Expense], type: ExpenseType = .all) -> String {
        var value: Double = 0
        value = expenses.reduce(0) { partialResult, expense in
            return partialResult + (type == .all ?(expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        }
        
        return convertNumberToPrice(value: value)
    }
    
    // MARK: Converting Selected Dates to String
    func convertDateToString() -> String {
        return startDate.formatted(date: .abbreviated, time: .omitted) + " - " +
        endDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    // MARK: Converting Number to Price
    func convertNumberToPrice(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        
        return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
    
    // MARK: Clearing All Data
    func clearData() {
        date = Date()
        type = .all
        remark = ""
        amount = ""
    }
    
    // MARK: Save Data
    func saveData(env: EnvironmentValues) {
        // MARK: Do Actions Here
        print("Save")
        let amountInDouble = (amount as NSString).doubleValue
        let colors = ["YellowColor", "RedColor", "PurpleColor", "GreenColor"]
        let expense = Expense(remark: remark, amount: amountInDouble, date: date, type: type, color: colors.randomElement() ?? "YellowColor")
        
        withAnimation { expenses.append(expense) }
        expenses = expenses.sorted(by: { (first, second) in
            return second.date < first.date
        })
        env.dismiss()
    }
}
