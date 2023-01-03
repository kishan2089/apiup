//
//  AppConstant.swift
//  Travel Bella
//
//  Created by iMac on 12/07/22.
//

import Foundation
import NVActivityIndicatorView
import UIKit

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), type: NVActivityIndicatorType.ballClipRotate, color: app_grey, padding: SCREEN_WIDTH/2.2)

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

enum AppStoryBoard : String {
    case Main = "Main"
    case Onboarding = "Onboarding"
    case FindPackage = "FindPackage"
    case SideMenu = "SideMenu"
    case BuildPackage = "BuildPackage"
    case Cruises = "Cruises"
    
    var instance : UIStoryboard  {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

class Storages {
    private let userFileURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
        .appendingPathComponent("User")
        .appendingPathExtension("plist")
    
    static let shared = Storages()
    
    func removeUser() {
        let text = ""
        do {
            try text.write(to: userFileURL, atomically: false, encoding: .utf8)
        } catch {
            
        }
    }

}
