//
//  StringExtension.swift
//  Travel-Bella
//
//  Created by iMac on 13/10/22.
//

import Foundation
import UIKit

extension String {
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
    
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.height
     }
}
