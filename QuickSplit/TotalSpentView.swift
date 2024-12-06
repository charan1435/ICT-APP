//
//  TotalSpentView.swift
//  QuickSplit
//
//  Created by Pubudu Mihiranga on 2024-11-10.
//

import SwiftUI

struct TotalSpentView: View {
    @State var internalTotal: Double = 0
    @Binding var savetoExpense : Bool
    @Binding var totalPerHead : Double
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Over all you spent ")
                Text("LKR \(String(format: "%.2f", internalTotal))")
                
                Button("Reset") {
                    savetoExpense=false
                    totalPerHead=0
                    internalTotal=0
                    
                    
                    
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
            .navigationTitle("Expenses")
            .onAppear(){
                if(savetoExpense==true){
                    internalTotal=totalPerHead
                }
                
            }
        }
    }
}

#Preview {
    TotalSpentView(savetoExpense: .constant(false),totalPerHead: .constant(0.0))
}
