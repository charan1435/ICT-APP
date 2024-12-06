//
//  RootView.swift
//  QuickSplit
//
//  Created by Pubudu Mihiranga on 2024-11-10.
//

import SwiftUI

struct RootView: View {
    @AppStorage("savedBoolValue")  var savetoExpense: Bool = false
    @AppStorage("savedValue")  var totalPerHead: Double = 0.0
    var body: some View {
        TabView {
            // system image name = calendar.badge.checkmark
            CalculatorView(totalPerHead: $totalPerHead, savetoExpense: $savetoExpense)
                .tabItem{
                    Label("Calculator",systemImage: "calendar.badge.checkmark")
                }
                
            // system image name = list.bullet
            TotalSpentView(savetoExpense: $savetoExpense, totalPerHead: $totalPerHead)
                .tabItem{
                    Label("Expenses",systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    RootView()
}
