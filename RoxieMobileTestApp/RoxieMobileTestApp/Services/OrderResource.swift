//
//  OrderResource.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 27.07.2022.
//

import Foundation

struct OrdersResource: NetworkResource {
    typealias ModelType = OrderInfo
    let methodPath = "/careers/test/orders.json"
}
