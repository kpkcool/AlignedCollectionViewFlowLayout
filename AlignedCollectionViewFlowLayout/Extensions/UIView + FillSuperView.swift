//
//  UIView + FillSuperView.swift
//  AlignedCollectionViewFlowLayout
//
//  Created by K Praveen Kumar on 06/10/23.
//

import UIKit

extension UIView {
    func fillSuperview() {
        guard let superview = superview else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
