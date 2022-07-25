//
//  NetworkService.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    static func getOrders() {
        
        AF
            .request("https://www.roxiemobile.ru/careers/test/orders.json")
            .responseData { response in
                switch response.result{
                case .success(let data):
                    let json = JSON(data)
                    print(json)
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    static func getImages() {
        
    }
}
