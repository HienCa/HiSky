//
//  ValidatorsUtils.swift
//  project
//
//  Created by Nguyen Van Hien on 6/4/24.
//

import UIKit
enum PasswordStrength{
    case WEAK, MEDIUM, STRONG
}
class ValidatorsUtils{
    static func isTextLengthValid(text: String, minLength: Int, maxLength:Int) -> Bool{
        let length = text.count
        return length >= minLength && length <= maxLength
    }
    
    static func limitTextLength(text: String, maxLength: Int) -> String{
        if(text.count > maxLength){
            let index = text.trimmingCharacters(in: .whitespacesAndNewlines).index(text.startIndex, offsetBy: maxLength)
            return String(text.prefix(upTo: index))
        }
        return text
    }
    
    static func containsSpecialCharacter(_ text:String) -> Bool{
        let characterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\",.<>?")
        return text.rangeOfCharacter(from: characterSet) != nil
    }
    
    static func containsNumber(_ text: String) -> Bool{
        let characterSet = CharacterSet(charactersIn: "0123456789")
        return text.rangeOfCharacter(from: characterSet) != nil
    }
    
    static func checkEmail(_ email: String) -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static func passwordStrength(_ password: String) -> PasswordStrength{
        let length = password.count
        if length < Constants.FORM_REQUIRED.LOGIN.PASSWORD_WEAK_LENGTH{
            return .WEAK
        }else if length < Constants.FORM_REQUIRED.LOGIN.PASSWORD_MEDIUM_LENGTH{
            return .MEDIUM
        }else{
            return .STRONG
        }
    }
    
}
