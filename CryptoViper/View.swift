//
//  View.swift
//  CryptoViper
//
//  Created by Baris on 16.11.2022.
//

import Foundation
import UIKit

// Talks to -> Presenter
// Class, protocol
// View Controller


//MARK: - View Protocol -
protocol AnyView {
    var presenter : AnyPresenter? {get set}
    
    func update(with cryptos: [Crypto])
    func update (with error : String)
}

//MARK: - View Class -
class CryptoView : UIViewController, AnyView {
    
    //MARK: - UI Elements
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Properties
    var presenter: AnyPresenter?
    var cryptos = [Crypto]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100 , y: view.frame.height / 2 - 25, width: 200, height: 100)
    }
    
    //MARK: - Funcitons
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.messageLabel.isHidden = false
            self.messageLabel.text = error
            self.tableView.reloadData()
            self.tableView.isHidden = true
        }
    }
    
}


//MARK: - TableView Properties -
@available(iOS 14.0, *)
extension CryptoView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price
        cell.contentConfiguration = content
        cell.backgroundColor = .brown
        return cell
        
    }
    
    
}
