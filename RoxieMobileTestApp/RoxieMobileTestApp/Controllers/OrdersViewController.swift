//
//  OrdersViewController.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 25.07.2022.
//

import UIKit

class OrdersViewController: UIViewController {
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

extension OrdersViewController {
    func fetchOrders() {
        let orderRequest = APIRequest(resource: OrdersResource())
        request = orderRequest
        orderRequest.execute { [weak self] (orders: [OrderInfo]?) in
            guard let orders = orders else { return }
            self?.orders = orders
            self?.orders.sort { $0.orderTime.compare($1.orderTime, options: .numeric) == .orderedDescending }
            self?.tableView.reloadData()
        }
    }
    
    func openDetails(for order: OrderInfo) {
        let detailsController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailsController?.orderIdText = String(order.id)
        detailsController?.startAddressText = "\(order.startAddress.address), г. \(order.startAddress.city)"
        detailsController?.endAddressText = "\(order.endAddress.address), г. \(order.endAddress.city)"
        detailsController?.dateOrderText = Settings.shared.formatter(for: order.orderTime)
        detailsController?.timeOrderText = Settings.shared.timeFormatter(for: order.orderTime)
        detailsController?.amountOrderText = Settings.shared.formatter(for: order.price.amount)
        detailsController?.driverNameText = order.vehicle.driverName
        detailsController?.regNumberText = order.vehicle.regNumber
        detailsController?.modelNameText = order.vehicle.modelName
        self.navigationController?.pushViewController(detailsController!, animated: true)
    }
}

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                       for: indexPath) as? OrdersTableViewCell
        else { return UITableViewCell() }
        cell.configure(withData: orders[indexPath.row])
        (indexPath.row  % 2 == 0) ? (cell.backgroundColor = UIColor.white) : (cell.backgroundColor = UIColor.superLightGray)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetails(for: orders[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension OrdersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
