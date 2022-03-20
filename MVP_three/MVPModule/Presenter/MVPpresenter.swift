//
//  MVPpresenter.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 20.03.2022.
//

import Foundation

protocol MVPProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MVPPresenterProtocol: AnyObject {
    var array: [UserModel?] { get set }
    init(view: MVPProtocol, networkService: NetworkServiceProtocol)
    func getData()
}

class MVPpresenter: MVPPresenterProtocol {
    var array: [UserModel?] = []
    let networkService: NetworkServiceProtocol
    weak var view: MVPProtocol?

    required init(view: MVPProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getData()
    }
    
    func getData() {
        networkService.getData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.array = data
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        }
    }
    
    
}
