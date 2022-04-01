//
//  HomeModel.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation

struct HomeModel: Codable {
    var user: User
    var account: Account
    var shortcuts: Shortcuts
    var highlights: Highlights
    var creditCard: CreditCard
    var loan: Loan
}

struct User: Codable {
    var name: String
}

struct Account: Codable {
    var balance: Double
}

struct CreditCard: Codable {
    var currentInvoice: Double
    var availableLimit: Double
}

struct Loan: Codable {
    var available: Double
}
