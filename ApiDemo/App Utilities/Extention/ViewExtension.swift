//
//  ViewExtension.swift
//  Travel-Bella
//
//  Created by iMac on 24/08/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addViewBorder(borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func addViewShadow(opacity: Float, offset: CGSize, radius: CGFloat, color: UIColor) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
    }
}

