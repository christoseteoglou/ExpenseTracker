//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Christos Eteoglou on 2023-11-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
