//
//  ExpenseCard.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3")
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    // MARK: Going Month/Date String
                    Text(isFilter ? expenseViewModel.currentMonthDateString() :
                            expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    // MARK: Current Month Expenses Price
                    Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses))
                        .font(.system(size: 35, weight: .bold))
                        .lineLimit(1)
                        .padding(.bottom, 5)
                }
                .offset(y: -10)
                
                HStack(spacing: 15) {
                    Image(systemName: "arrow.down")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("GreenColor"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "arrow.up")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("RedColor"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expenses")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .fixedSize()
                    }
                }
                .padding(.horizontal)
                .padding(.trailing)
                .offset(y: 15)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 220)
        .padding(.top)
    }
}
