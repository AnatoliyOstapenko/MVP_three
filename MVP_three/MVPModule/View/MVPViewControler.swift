//
//  ViewController.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import UIKit

class MVPViewControler: UIViewController {

    var presenter: MVPPresenterProtocol?
    
    let mvpTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "MVPTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.mvpCell)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVP Module"
        view.addSubview(mvpTableView)
        mvpTableView.mvpLabelConstraints(view: view) // set constraints from extensions
        mvpTableView.dataSource = self
        //mvpTableView.delegate = self

    }
}

// MARK: - TableView DataSource
extension MVPViewControler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.array.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mvpCell, for: indexPath) as! MVPTableViewCell
        cell.usernameLabel.text = presenter?.array[indexPath.row]?.username
        cell.fullNameLabel.text = presenter?.array[indexPath.row]?.name
        cell.emailLabel.text = presenter?.array[indexPath.row]?.email
        
        return cell
    }
    
    
}

//// MARK: - TableView Delegate
//extension MVPViewControler: UITableViewDelegate {
//
//}

// MARK: - MVP Delegate
extension MVPViewControler: MVPProtocol {
    func success() {
        mvpTableView.reloadData()
    }

    func failure(error: Error) {
        print(error.localizedDescription)
    }


}


