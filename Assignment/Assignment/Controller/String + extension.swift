//
//  String + extension.swift
//  Assignment
//
//  Created by Pritesh on 22/06/21.
//

import Foundation

extension String{
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applypredicateOnRegex(regexStr: emailRegEx)
    }
    
    func validatepassword(mini: Int = 8 , max: Int = 14) -> Bool {
        var passRegEx = ""
        if mini >= max {
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }
        else{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applypredicateOnRegex(regexStr: passRegEx)
    }
    
    
    
    
    func applypredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
