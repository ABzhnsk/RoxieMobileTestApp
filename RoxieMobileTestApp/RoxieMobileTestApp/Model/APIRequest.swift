//
//  APIRequest.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 27.07.2022.
//

import Foundation

class APIRequest<Resource: NetworkResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}
