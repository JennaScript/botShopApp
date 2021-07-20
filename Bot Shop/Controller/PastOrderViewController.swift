//
//  PastOrderViewController.swift
//  Bot Shop
//
//  Created by Jennalyn Kabiling on 7/11/21.
//
import Foundation
import UIKit

class PastOrderViewController: UIViewController {
    
    let tableView = UITableView()
    
//    let orders = [
//        Order(title: "July 2020", image: UIImage(named: "box")!),
//        Order(title: "June 2020", image: UIImage(named: "box")!),
//        Order(title: "May 2020", image: UIImage(named: "box")!),
//        Order(title: "December 2020", image: UIImage(named: "box")!),
//        Order(title: "November 2020", image: UIImage(named: "box")!),
//        Order(title: "October 2019", image: UIImage(named: "box")!),
//        Order(title: "September 2019", image: UIImage(named: "box")!)
//    ]
    
    var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        // I will never get used to the multitude of things necessary to set up a tableView
        tableView.register(PastOrderCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        setupTableView()
        getItems()
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func getItems() {
        let robot1 = Item(title: "Respiratory", image: UIImage(named: "robot1")!)
        let robot2 = Item(title: "Muscular", image: UIImage(named: "robot2")!)
        let robot3 = Item(title: "Endocrine", image: UIImage(named: "robot3")!)
        let robot4 = Item(title: "Excretory", image: UIImage(named: "robot4")!)
        let robot5 = Item(title: "Lymphatic", image: UIImage(named: "robot5")!)
        let robot6 = Item(title: "Nervous", image: UIImage(named: "robot6")!)
        
        let ordersList = [
            Order(title: "July 2020", image: UIImage(named: "box")!, items: [robot1, robot3]),
            Order(title: "June 2020", image: UIImage(named: "box")!, items: [robot2, robot3, robot6]),
            Order(title: "May 2020", image: UIImage(named: "box")!, items: [robot4, robot1]),
            Order(title: "December 2019", image: UIImage(named: "box")!, items: [robot2, robot5, robot6])
        ]
        
        for box in ordersList {
            orders.append(box)
        }
    }

}

extension PastOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PastOrderCell
        // Create a chevron-shaped indicator for each cell to imply the user can touch for more detail
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.setBoxContents(box: orders[indexPath.row])
        cell.textLabel?.text = "\(indexPath.row + 1) \(orders[indexPath.row].title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected!")
        let nextVC: OrderList = OrderList()
        nextVC.currentOrder = orders[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
