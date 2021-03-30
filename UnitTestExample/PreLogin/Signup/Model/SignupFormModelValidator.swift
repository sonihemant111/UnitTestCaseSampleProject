//
//  SignupFormModelValidator.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
struct SignupFormModelValidator: SignupFormModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupFormConstants.firstNameMinLength || firstName.count > SignupFormConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupFormConstants.lastNameMinLength || lastName.count > SignupFormConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupFormConstants.passwordMinLength ||
            password.count > SignupFormConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isConfirmPasswordValid(password: String) -> Bool {
        var returnValue = true
        if password.count == 0 {
            returnValue = false
        }
        return returnValue
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
}
