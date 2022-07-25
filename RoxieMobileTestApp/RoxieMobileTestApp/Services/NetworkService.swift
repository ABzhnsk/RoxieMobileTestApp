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
    static func getOrders(url: String, completion: @escaping ([OrderInfo]) -> Void) {
        AF
            .request(url, method: .get)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let orders = json.arrayValue.compactMap { OrderInfo($0) }
                    completion(orders)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func getImages(url: String, imageName: String, completion: @escaping (UIImage?) -> Void) {
        AF
            .request(url + imageName, method: .get).responseData { response in
                switch response.result{
                case .success(let data):
                    let image = UIImage(data: data)
                    completion(image)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
