//
//  OrderService.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import Foundation
import UIKit

class OrderService {
    var ordersInfo = [OrderInfo]()
    var ordersImage = [UIImage]()
    
    func loadOrders() {
        let ordersURL = "https://www.roxiemobile.ru/careers/test/orders.json"
        
        NetworkService.getOrders(url: ordersURL) { [weak self] orders in
            self?.ordersInfo = orders
        }
    }
    
    func loadOrdersImage() {
        let imageOrdersURL = "https://www.roxiemobile.ru/careers/test/images/"
        
        for i in 0...ordersInfo.count {
            NetworkService.getImages(url: imageOrdersURL, imageName: ordersInfo[i].photo) { [weak self] image in
                guard let image = image else { return }
                self?.ordersImage[i] = image
            }
        }
    }
}
