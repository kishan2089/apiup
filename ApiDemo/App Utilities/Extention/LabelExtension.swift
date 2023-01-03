//
//  LabelExtension.swift
//  Travel-Bella
//
//  Created by iMac on 18/08/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func dropTextShadow(shadowColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
    
    func titleLabelText(titleText: String, textColor: UIColor) {
        self.text = titleText
        self.textColor = textColor
        self.font = AppFont.size12.sfontMonstserratSemiBold
    }
    
    func addTitleLabelText(titleText: String) {
        self.text = titleText
        self.textColor = app_black
        self.font = AppFont.size14.sfontMonstserratBold
    }
    
    func addSubTitleLabelText() {
        self.textColor = app_black
        self.font = AppFont.size14.sfontMonstserratRegular
    }
}
