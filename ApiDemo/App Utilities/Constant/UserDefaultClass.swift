//
//  UserDefaultClass.swift
//  Birthday_Calender
//
//  Created by iMac on 02/06/21.
//

import Foundation
import UIKit

class UserDefaultClass: NSObject {
    
    
    static let sharedInstanse = UserDefaultClass()
    let defaults = UserDefaults.standard
    
    func userLogIn(key: String, value: Any) {
        defaults.set(value, forKey: key)
    }
    
    func setUpValue(key: String, Value: Any) {
        UserDefaults.standard.setValue(Value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func retrieveString(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    func retrieveflag(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    func removeValue(key:String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func removeAllUserDefault() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach{ key in
            defaults.removeObject(forKey: key)
        }
        
    }
    
    // MARK:- Userdefaults Keys Enum
    enum appMainKey : String {
        case isLogin = "isLogin"
        case fcmToken = "fcmToken"
        case userName = "userName"
        case customerId = "customerId"
    }
}
