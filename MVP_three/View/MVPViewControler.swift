//
//  ViewController.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import UIKit

class MVPViewControler: UIViewController {
    
    var array: [UserModel] = []
    
    let mvpTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "MVPTableViewCell", bundle: nil), forCellReuseIdentifier: "MVPCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mvpTableView)
        mvpTableView.mvpLabelConstraints(view: view) // set constraints from extensions
        mvpTableView.dataSource = self
        mvpTableView.delegate = self
        
        array = testData()
    }

}

// MARK: - TableView DataSource
extension MVPViewControler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MVPCell", for: indexPath) as! MVPTableViewCell
        cell.getListOfText(data: array[indexPath.row])
        return cell
    }
    
    
}

// MARK: - TableView Delegate
extension MVPViewControler: UITableViewDelegate {
    
}

extension MVPViewControler {
    func testData() -> [UserModel] {
        let row1 = UserModel(id: 1, name: "Bill", username: "b222", email: "a@mail.com", phone: "000", website: "www")
        let row2 = UserModel(id: 1, name: "John", username: "jn0921", email: "a@mail.com", phone: "000", website: "www")
        let row3 = UserModel(id: 1, name: "David", username: "dav90", email: "a@mail.com", phone: "000", website: "www")
        let row4 = UserModel(id: 1, name: "Lucy", username: "luc21", email: "a@mail.com", phone: "000", website: "www")
        
        return [row1, row2, row3, row4]
    }
}

