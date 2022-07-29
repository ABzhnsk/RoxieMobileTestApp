//
//  Settings.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 28.07.2022.
//

import Foundation

class Settings: NSObject {
    static let shared = Settings()
    
    private override init() {
        super.init()
    }
    
    func formatter(for date: String) -> String {
        guard let date = ISO8601DateFormatter().date(from: date) else {return ""}
        let stringDate = DateFormatter.dateFormatter.string(from: date)
        return stringDate
    }
    
    func formatter(for amount: Int) -> String {
        let amount: Float = Float(amount) / 100
        let amountString = NumberFormatter.currencyFormatter.string(from: amount as NSNumber)
        return amountString ?? ""
    }
    
    func timeFormatter(for time: String) -> String {
        guard let date = ISO8601DateFormatter().date(from: time) else {return ""}
        let stringTime = DateFormatter.timeFormatter.string(from: date)
        return stringTime
    }
}
