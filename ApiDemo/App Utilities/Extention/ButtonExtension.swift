//
//  ButtonExtension.swift
//  Travel-Bella
//
//  Created by iMac on 24/08/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func addButtonBorder(borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func proceedButton(buttonText: String, bgColor: UIColor) {
        self.setTitleColor(app_white, for: .normal)
        self.setTitle(buttonText, for: .normal)
        self.backgroundColor = bgColor
        self.titleLabel?.font = AppFont.size14.sfontMonstserratBold
        self.layer.cornerRadius = 10
    }
}
