//
//  OrderService.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import Foundation
import UIKit

class OrderService {
    static var ordersInfo = [OrderInfo]()
    static var ordersImage = [UIImage]()
    
    static func loadOrders() {
        let ordersURL = "https://www.roxiemobile.ru/careers/test/orders.json"
        
        NetworkService.getOrders(url: ordersURL) { orders in
            ordersInfo = orders
        }
    }
    
    static func loadOrdersImage() {
        let imageOrdersURL = "https://www.roxiemobile.ru/careers/test/images/"
        
        for i in 0...ordersInfo.count {
            NetworkService.getImages(url: imageOrdersURL, imageName: ordersInfo[i].photo) { image in
                guard let image = image else { return }
                ordersImage[i] = image
            }
        }
    }
}
