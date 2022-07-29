//
//  NumberFormatter+Extension.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 29.07.2022.
//

import Foundation

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let currency = NumberFormatter()
        currency.usesGroupingSeparator = true
        currency.numberStyle = .currency
        currency.locale = Locale(identifier: "ru_RU")
        return currency
    }()
}
