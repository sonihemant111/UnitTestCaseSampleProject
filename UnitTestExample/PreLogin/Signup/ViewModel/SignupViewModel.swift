//
//  SignupViewModel.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
class SignupViewModel {

    private var formModelValidator: SignupFormModelValidatorProtocol
    private lazy var webService = SignupWebService()
    var viewModelDelegate: SignupViewModelProtocol?
    
    init(_ validatorModel: SignupFormModelValidatorProtocol) {
        self.formModelValidator = validatorModel
    }
    
    // Method to call Signup API
    private func callSignupAPI(_ requestModel: SignupFormRequestModel) {
        webService.signup(withForm: requestModel, url: URLManager.init().signup) { (signupResponseModel, err) in
            guard let delegate =  self.viewModelDelegate else { return }
            if err == nil {
                delegate.didReceiveError(error: err)
            } else {
                delegate.success()
            }
        }
    }
    
    func processUserSignup(formModel: SignupFormModel) -> InvalidEntry {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return .invalidFirstName
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return .invalidLastName
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return .invalidEmail
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return .invalidPassword
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.confirmPassword) {
            return .passwordConfirmPasswordNotMatch
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        callSignupAPI(requestModel)
        return .none
    }
}
