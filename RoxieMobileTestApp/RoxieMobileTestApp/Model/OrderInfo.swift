//
//  OrderInfo.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import Foundation

struct OrderInfo: Decodable {
    let id: Int
    let startAddress: Address
    let endAddress: Address
    let price: Price
    let orderTime: String
    let vehicle: Vehicle
}

struct Address: Decodable {
    let city: String
    let address: String
}

struct Price: Decodable {
    let amount: Int
    let currency: String
}

struct Vehicle: Decodable {
    let regNumber: String
    let modelName: String
    let photo: String
    let driverName: String
}
