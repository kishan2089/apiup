//
//  Validater.swift
//  signUpDemo
//
//  Created by iMac on 18/02/22.
//

import Foundation
import UIKit

class Validator: NSObject {
    
    class var sharedInstance: Validator {
        struct Singleton {
            static let instance = Validator()
        }
        return Singleton.instance
    }
    
    //MARK: - Validate empty field
    func isValidEmpty(text: String) -> Bool{
        let data = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if data.isEmpty || data.count == 0 {
            return false
        }
        return true
    }
    
    //MARK: - Email validation function
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "^([A-Za-z0-9._%+-\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //MARK: - Contact Number Validation Function
    func isValidPhoneNo(phoneno: String) -> Bool {
        let phoneNoRegEx = "^[0-9+]{0,1}+[0-9]{7,12}$"
        let phoneNoTest = NSPredicate(format:"SELF MATCHES %@", phoneNoRegEx)
        return phoneNoTest.evaluate(with: phoneno)
    }
    
    //MARK: - Passport Number Validation Function
    func isValidPassport(passportId:String) -> Bool {
      let passportRegEx = "^(?!^0+$)[a-zA-Z0-9]{5,14}$"
      let passportPred = NSPredicate(format:"SELF MATCHES %@", passportRegEx)
      return passportPred.evaluate(with: passportId)
    }
    
}
