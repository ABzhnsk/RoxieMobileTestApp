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
