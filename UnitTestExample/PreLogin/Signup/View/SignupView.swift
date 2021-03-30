//
//  SignupView.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit
enum SignupViewAction{
    case showAlert
}

class SignupView: UIView {
    @IBOutlet weak var firstNameTextField: MyTextField!
    @IBOutlet weak var lastNameTextField: MyTextField!
    @IBOutlet weak var emailTextField: MyTextField!
    @IBOutlet weak var passwordTextField: MyTextField!
    @IBOutlet weak var confirmPasswordTextField: MyTextField!
    @IBOutlet weak var submitButton: MyButton!
    
    private var viewModel: SignupViewModel?
    var delegate: SignupViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let validator = SignupFormModelValidator()
        viewModel = SignupViewModel(validator)
        viewModel?.viewModelDelegate = self
    }
    
    func setAccessibilityIdentifier() {
        firstNameTextField.accessibilityIdentifier = "firstNameTextField"
        lastNameTextField.accessibilityIdentifier = "lastNameTextField"
        emailTextField.accessibilityIdentifier = "emailTextField"
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        confirmPasswordTextField.accessibilityIdentifier = "confirmPasswordTextField"
        submitButton.accessibilityIdentifier = "submitButton"
    }
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
        let objSignupModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "")
        guard let delegate = self.delegate else { return }
        
        if let result = viewModel?.processUserSignup(formModel: objSignupModel) {
            switch result {
            case .invalidFirstName:
                delegate.view(didPerformAction: SignupViewAction.showAlert, userInfo: "First Name should be minimum two character and maximum 10 characters long.")
            case .invalidLastName:
                delegate.view(didPerformAction: SignupViewAction.showAlert, userInfo: "Last Name should be minimum two character and maximum 12 characters long.")
            case .invalidEmail:
                delegate.view(didPerformAction: SignupViewAction.showAlert, userInfo: "Please enter a valid email address.")
            case .invalidPassword:
                delegate.view(didPerformAction: SignupViewAction.showAlert, userInfo: "Password should be minimum two character and maximum 12 characters long.")
            case .passwordConfirmPasswordNotMatch:
                delegate.view(didPerformAction: SignupViewAction.showAlert, userInfo: "Password and Confirm Password should be same.")
            case .none:
                break
            }
        }
    }
}

extension SignupView: SignupViewModelProtocol {
    
    func success() {
        // inform view controll to show a popup
    }
    
    func didReceiveError(error: Error?) {
        // inform view controll to show a popup
        
    }
}
