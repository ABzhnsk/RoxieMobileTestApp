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
    
    func configure(withData order: OrderInfo) {
        self.startAddress.text = "Откуда: \(order.startAddress.address), г. \(order.startAddress.city)"
        self.endAddress.text = "Куда: \(order.endAddress.address), г. \(order.endAddress.city)"
        self.dateOrder.text = "Дата: \(Settings.shared.formatter(for: order.orderTime))"
        self.amountOrder.text = "Стоимость: \(Settings.shared.formatter(for: order.price.amount))"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.startAddress.text = nil
        self.endAddress.text = nil
        self.dateOrder.text = nil
        self.amountOrder.text = nil
    }
}
