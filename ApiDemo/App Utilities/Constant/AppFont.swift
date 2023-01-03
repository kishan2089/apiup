//
//  AppFont.swift
//  Travel Bella
//
//  Created by iMac on 12/07/22.
//

import Foundation
import UIKit

enum AppFont: CGFloat {
    case size7 = 7.0
    case size8 = 8.0
    case size9 = 9.0
    case size10 = 10.0
    case size11 = 11.0
    case size12 = 12.0
    case size13 = 13.0
    case size14 = 14.0
    case size15 = 15.0
    case size16 = 16.0
    case size17 = 17.0
    case size18 = 18.0
    case size19 = 19.0
    case size20 = 20.0
    case size21 = 21.0
    case size22 = 22.0
    case size23 = 23.0
    case size24 = 24.0
    case size25 = 25.0
    case size26 = 26.0
    case size27 = 27.0
    case size28 = 28.0
    case size29 = 29.0
    case size30 = 30.0
    case size31 = 31.0
    case size32 = 32.0
    case size33 = 33.0
    case size34 = 34.0
    case size35 = 35.0
    
    var sfontEuropaBold : UIFont {
        return UIFont.init(name: fontEuropaBold, size: self.rawValue)!
    }
    
//    var sfontEuropaExtraBold : UIFont {
//        return UIFont.init(name: fontEuropaExtraBold, size:  self.rawValue)!
//    }
    
    var sfontEuropaRegular : UIFont {
        return UIFont.init(name: fontEuropaRegular, size:  self.rawValue)!
    }
    
    var sfontMonstserratBold : UIFont {
        return UIFont.init(name: fontMonstserratBold, size:  self.rawValue)!
    }
    
    var sfontMonstserratRegular : UIFont {
        return UIFont.init(name: fontMonstserratRegular, size:  self.rawValue)!
    }
    
    var sfontMonstserratSemiBold : UIFont {
        return UIFont.init(name: fontMonstserratSemiBold, size:  self.rawValue)!
    }
    
    var sfontMonstserratMedium : UIFont {
        return UIFont.init(name: fontMonstserratMedium, size:  self.rawValue)!
    }
    
    var sfontCenturyGothicBold : UIFont {
        return UIFont.init(name: fontCenturyGothicBold, size:  self.rawValue)!
    }
    
    var sfontEuropaLight : UIFont {
        return UIFont.init(name: fontEuropaLight, size:  self.rawValue)!
    }
    
    var sfontLatoBold : UIFont {
        return UIFont.init(name: fontLatoBold, size:  self.rawValue)!
    }
}

// MARK:- Font
let fontEuropaBold = "Europa-Bold"
//let fontEuropaExtraBold = "EuropaNuova-ExtraBold"
let fontEuropaRegular = "Europa-Regular"
let fontMonstserratBold = "Montserrat-Bold"
let fontMonstserratRegular = "Montserrat-Regular"
let fontMonstserratSemiBold = "Montserrat-SemiBold"
let fontMonstserratMedium = "Montserrat-Medium"
let fontCenturyGothicBold = "Century Gothic Bold"
let fontEuropaLight = "Europa-Light"
let fontLatoBold = "Lato-Bold"
