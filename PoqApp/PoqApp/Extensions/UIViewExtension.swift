//
//  UIViewExtension.swift
//  PoqApp
//
//  Created by Emre on 15.01.2022.
//

import UIKit

extension UIView {

    func addBorder(color: UIColor = .gray, radius: CGFloat = 0, borderWidth: CGFloat = 1) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
    }

}
