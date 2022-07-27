//
//  NetworkResourceProtocol.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 27.07.2022.
//

import Foundation

protocol NetworkResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension NetworkResource {
    var url: URL {
        var components = URLComponents(string: "https://www.roxiemobile.ru")!
        components.path = methodPath
        return components.url!
    }
}
