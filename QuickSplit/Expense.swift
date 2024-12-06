//
//  Expense.swift
//  QuickSplit
//
//  Created by Pubudu Mihiranga on 2024-11-10.
//

import Foundation

struct Expense: Hashable {
    let title: String
    let totalAmount: Double
    let numberOfPeople: Int
    let splitAmount: Double
}
