//
//  StartViewController.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import UIKit

class StartViewController: UIViewController {
    private var orders = [OrderInfo]()
    private var request: APIRequest<OrdersResource>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOrders()
    }
}

extension StartViewController {
    func fetchOrders() {
        let orderRequest = APIRequest(resource: OrdersResource())
        request = orderRequest
        orderRequest.execute { [weak self] (orders: [OrderInfo]?) in
            guard let orders = orders else { return }
            self?.orders = orders
        }
    }
}
