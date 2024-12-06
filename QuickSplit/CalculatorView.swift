//
//  CalculatorView.swift
//  QuickSplit
//
//  Created by Pubudu Mihiranga on 2024-11-10.
//

import SwiftUI

struct CalculatorView: View {
    // define your property wrappers here
    // you can use AppStorage property wrapper to persistance
    @State private var totalAmount: Double? = nil
    @State private var tip: Double? = nil
    @State private var numberOfPeople: Int? = nil
    @Binding  var totalPerHead: Double
    @State private var expenseList: [Expense] = []
    @State private var showAlert : Bool = false
    @Binding  var savetoExpense: Bool
    @Environment(\.dismiss) var dismiss
    @State var toggleForChange : Bool = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            // create you alert here using .alert view modifier
            VStack {
                TextField("total amount",value: $totalAmount, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .tint(.red)
                TextField("tip amount",value: $tip, format: .number)
                    .textFieldStyle(.roundedBorder)
                TextField("number of people",value: $numberOfPeople, format: .number)
                    .textFieldStyle(.roundedBorder)
                Button("Calculate") {
                    // business logic to calculate split amount for given data and displaying alert
                    if(totalAmount==nil || tip==nil || numberOfPeople==nil){
                        print("Value Missing")
                        
                        
                    }else{
                        calculateSplitAmount()
                        showAlert.toggle()
                        
                    }
                    
                    
                    
                    
                }
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
                    .alert( isPresented: $showAlert){
                        Alert(title: Text("You Owe"),
                              message: Text("\(String(format: "%.2f", totalPerHead))"),
                              primaryButton: .default(
                                Text("Save to expense"),
                                action: saveData),
                              secondaryButton: .destructive(
                                Text("Cancel"),
                                action: dismmissAct
                              )
                        )
                    }
                                    
                Toggle(isOn: $toggleForChange) {
                        Text("Dark Mood")
                    }

            }
            .padding()
            .navigationTitle("QuickSplit")
            
        }
        
    }
    
    func calculateSplitAmount() {
        
        totalPerHead = (totalAmount!+tip!) / Double(numberOfPeople!)
       
        
    }
    func saveData() -> Void {
        savetoExpense=true
        totalAmount = nil
        tip = nil
        numberOfPeople = nil 
        dismiss()
        
        
    }
    
    func dismmissAct() -> Void {
        dismiss()
        savetoExpense=false
        
    }
}

#Preview {
    CalculatorView(totalPerHead:.constant(0.0), savetoExpense: .constant(true))
}
