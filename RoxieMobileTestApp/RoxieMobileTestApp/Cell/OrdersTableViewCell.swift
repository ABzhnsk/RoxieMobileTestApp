//
//  OrdersTableViewCell.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 27.07.2022.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startAddress: UILabel!
    @IBOutlet weak var endAddress: UILabel!
    @IBOutlet weak var dateOrder: UILabel!
    @IBOutlet weak var amountOrder: UILabel!
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }()
    
    static let currencyFormatter: NumberFormatter = {
        let currency = NumberFormatter()
        currency.usesGroupingSeparator = true
        currency.numberStyle = .currency
        currency.locale = Locale(identifier: "ru_RU")
        return currency
    }()
    
    func configure(withData order: OrderInfo) {
        let isoDateFormatter = ISO8601DateFormatter()
        guard let date = isoDateFormatter.date(from: order.orderTime) else {return}
        let stringDate = OrdersTableViewCell.dateFormatter.string(from: date)
        let amount: Float = Float(order.price.amount) / 100
        let amountString = OrdersTableViewCell.currencyFormatter.string(from: amount as NSNumber)
        self.startAddress.text = "Откуда: \(order.startAddress.address)"
        self.endAddress.text = "Куда: \(order.endAddress.address)"
        self.dateOrder.text = "Дата: \(stringDate)"
        self.amountOrder.text = "Стоимость: \(amountString ?? "")"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.startAddress.text = nil
        self.endAddress.text = nil
        self.dateOrder.text = nil
        self.amountOrder.text = nil
    }
}
