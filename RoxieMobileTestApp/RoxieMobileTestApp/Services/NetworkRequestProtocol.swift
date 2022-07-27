//
//  NetworkRequestProtocol.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 27.07.2022.
//

import Foundation
import Alamofire

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        AF
            .request(url, method: .get)
            .responseData { [weak self] response in
                guard let data = response.value else {
                    DispatchQueue.main.async { completion(nil) }
                    return
                }
                DispatchQueue.main.async { completion(self?.decode(data)) }
            }
    }
}
