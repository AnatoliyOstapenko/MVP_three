//
//  UIView+Ext.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 20.03.2022.
//

import UIKit

extension UIView {
    
    func mvpLabelConstraints(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
