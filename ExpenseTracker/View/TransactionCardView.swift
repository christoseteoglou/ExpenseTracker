//
//  TransactionCardView.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            // MARK: First Letter Avatar
            if let first = expense.remark.first {
                Text(String(first))
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .background {
                        Circle()
                            .fill(Color(expense.color))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 7) {
                // MARK: Displaying Price
                let price = expenseViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundStyle(expense.type == .expense ? Color("RedColor") : Color("GreenColor"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .opacity(0.5)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        }
    }
}

#Preview {
    ContentView()
}
