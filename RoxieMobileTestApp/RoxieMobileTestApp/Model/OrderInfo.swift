//
//  OrderInfo.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import Foundation
import SwiftyJSON

struct OrderInfo {
    let id: Int
    let startCity: String
    let startAddress: String
    let endCity: String
    let endAddress: String
    let amount: Int
    let currency: String
    let orderTime: String
    let regNumber: String
    let modelName: String
    let photo: String
    let driverName: String
    
    init(_ json: JSON){
        self.id = json["id"].intValue
        self.startCity = json["startAddress"]["city"].stringValue
        self.startAddress = json["startAddress"]["address"].stringValue
        self.endCity = json["endAddress"]["city"].stringValue
        self.endAddress = json["endAddress"]["address"].stringValue
        self.amount = json["price"]["amount"].intValue
        self.currency = json["price"]["currency"].stringValue
        self.orderTime = json["orderTime"].stringValue
        self.regNumber = json["vehicle"]["regNumber"].stringValue
        self.modelName = json["vehicle"]["modelName"].stringValue
        self.photo = json["vehicle"]["photo"].stringValue
        self.driverName = json["vehicle"]["driverName"].stringValue
    }
}
