//
//  SignupViewTests.swift
//  UnitTestExampleTests
//
//  Created by hemant on 3/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class SignupViewTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    var signupView: SignupView!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "PreLogin", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
        signupView = sut.view as? SignupView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    func testSignupView_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        let firstNameTextField = try XCTUnwrap(signupView.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(signupView.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(signupView.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(signupView.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let confirmPasswordTextField = try XCTUnwrap(signupView.confirmPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "","Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(confirmPasswordTextField.text, "","Repeat Password text field was not empty when the view controller initially loaded")
    }
    
    func testSignupView_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(signupView.submitButton, "Signup button doesn't have a referencing outlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut.view as? SignupView, forControlEvent: .touchUpInside), "Signup button doen't have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "submitButtonAction:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    func testSignupView_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        // Act
        signupView.submitButton.sendActions(for: .touchUpInside)
        // Assert
    }

}
