//
//  StartViewController.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var orders = [OrderInfo]()
    private var request: APIRequest<OrdersResource>?
    private let reuseIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
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
            self?.tableView.reloadData()
        }
    }
}

extension StartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                       for: indexPath) as? OrdersTableViewCell
        else { return UITableViewCell() }
        cell.configure(withData: orders[indexPath.row])
        return cell
    }
}

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
