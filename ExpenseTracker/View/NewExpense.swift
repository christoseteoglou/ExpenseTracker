//
//  NewExpense.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import SwiftUI

struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    // MARK: Environment Values
    @Environment(\.dismiss) var dismiss
    @Environment(\.self) var env
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Text("Add Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                // MARK: Custom TextField)
                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first {
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundStyle(Color("Gradient2"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background {
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule()
                                .fill(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top)
                    
                }
                
                // MARK: Custom Labels
                Label {
                    TextField("Remark", text: $expenseViewModel.remark)
                        .padding(.leading, 10)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundStyle(Color("GrayColor"))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 25)
                
                Label {
                    // MARK: Checkboxes - Look at the bottom of this file
                    CustomChekboxes()
                } icon: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.title3)
                        .foregroundStyle(Color("GrayColor"))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 5)
                
                Label {
                    DatePicker.init("", selection: $expenseViewModel.date, in: Date.distantPast...Date(), displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundStyle(Color("GrayColor"))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top, 5)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            
            // MARK: Save Button
            Button(action: {expenseViewModel.saveData(env: env)}) {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(
                                LinearGradient(colors: [
                                    Color("Gradient1"),
                                    Color("Gradient2"),
                                    Color("Gradient3")
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .foregroundStyle(.white)
                    .padding(.bottom, 10)
            }
            .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
            .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            // MARK: Close Button
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .opacity(0.7)
            }
            .padding()
        }
    }
    
    // MARK: Checkboxes
    @ViewBuilder
    func CustomChekboxes() -> some View {
        HStack(spacing: 10) {
            ForEach([ExpenseType.income, ExpenseType.expense], id: \.self) { type in
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black, lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    if expenseViewModel.type == type {
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundStyle(Color("GreenColor"))
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}

#Preview {
    NewExpense()
        .environmentObject(ExpenseViewModel())
}
