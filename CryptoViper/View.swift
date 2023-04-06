//
//  View.swift
//  CryptoViper
//
//  Created by Can Kanbur on 6.04.2023.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func update(with cryptos: [Crypto])
    func update(with error: String)
}

class CryptoViewController: UIViewController, AnyView, UITableViewDelegate, UINavigationControllerDelegate, UITableViewDataSource {
    func update(with error: String) {
        messageLabel.text = error
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    var presenter: AnyPresenter?
    var cryptos = [Crypto]()

    private var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "Downloading"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        view.backgroundColor = .lightGray
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
    }

    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }

//    func update(with error: String) {
//        <#code#>
//    }
}
