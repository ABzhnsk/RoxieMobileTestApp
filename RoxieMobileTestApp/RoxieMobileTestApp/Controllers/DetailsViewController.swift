//
//  DetailsViewController.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 28.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startAddress: UILabel!
    @IBOutlet weak var endAddress: UILabel!
    @IBOutlet weak var dateOrder: UILabel!
    @IBOutlet weak var timeOrder: UILabel!
    @IBOutlet weak var amountOrder: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var regNumber: UILabel!
    @IBOutlet weak var modelName: UILabel!
    
    var orderIdText = String()
    var startAddressText = String()
    var endAddressText = String()
    var dateOrderText = String()
    var timeOrderText = String()
    var amountOrderText = String()
    var driverNameText = String()
    var regNumberText = String()
    var modelNameText = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageView.image = nil
        self.orderId.text = "Заказ №\(orderIdText)"
        self.startAddress.text = "Откуда: \(startAddressText)"
        self.endAddress.text = "Куда: \(endAddressText)"
        self.dateOrder.text = "Дата заказа: \(dateOrderText)"
        self.timeOrder.text = "Время заказа: \(timeOrderText)"
        self.amountOrder.text = "Стоимость: \(amountOrderText)"
        self.driverName.text = "Водитель: \(driverNameText)"
        self.regNumber.text = "Номер машины: \(regNumberText)"
        self.modelName.text = "Модель машины: \(modelNameText) "
    }
}
