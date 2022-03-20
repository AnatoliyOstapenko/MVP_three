//
//  Builder.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 20.03.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func createMVPModule() -> UIViewController
}

// It's mandatory to use protocols instead controllers
class Builder: BuilderProtocol {
    // Method to use in SceneDelegate
    static func createMVPModule() -> UIViewController {
        let view = MVPViewControler()
        let networkService = NetworkService()
        let presenter = MVPpresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
        
    }
    
}
