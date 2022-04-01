//
//  CurrencyExtensions.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation

extension Formatter {
    static let date: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()
}


extension String {
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        return formatter
    }
    
    var currencyValue: String {
        let decimal = (self.digits.decimal / Decimal(100))
        if decimal == 0 { return "" }
        return formatter.string(from: NSNumber(value: decimal.number.doubleValue)) ?? ""
    }
    
    var withoutCurrencyValue: Double? {
        formatter.number(from: self)?.doubleValue
    }
}

extension Double {
    var currency: String? {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")

        guard let formattedTipAmount = formatter.string(for: self) else { return nil }

        return formattedTipAmount
    }
}

extension String {
    var digits: [UInt8] {
        return map(String.init).compactMap(UInt8.init)
    }
}

extension Collection where Iterator.Element == UInt8 {
    var string: String { return map(String.init).joined() }
    var decimal: Decimal { return Decimal(string: string) ?? 0 }
}

extension Decimal {
    var number: NSDecimalNumber { return NSDecimalNumber(decimal: self) }
}

