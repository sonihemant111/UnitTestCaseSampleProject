//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import XCTest

class UnitTestExampleUITests: XCTestCase {
    var app: XCUIApplication!
    var firstNameTextField: XCUIElement!
    var lastNameTextField: XCUIElement!
    var emailTextField: XCUIElement!
    var passwordTextField: XCUIElement!
    var confirmPasswordTextField: XCUIElement!
    var submitButton: XCUIElement!
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        // Initialize XCUIElement
        firstNameTextField = app.textFields["firstNameTextField"]
        lastNameTextField = app.textFields["lastNameTextField"]
        emailTextField = app.textFields["emailTextField"]
        passwordTextField = app.textFields["passwordTextField"]
        confirmPasswordTextField = app.textFields["confirmPasswordTextField"]
        submitButton = app.buttons["submitButton"]
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        app = nil
        firstNameTextField = nil
        emailTextField = nil
        passwordTextField = nil
        confirmPasswordTextField = nil
        submitButton = nil
        try super.tearDownWithError()
    }
    
    func testSignupView_WhenViewLoaded_RequiredElementsAreEnabled() {
        // First Name textfield
        XCTAssertTrue(firstNameTextField.isEnabled, "firstNameTextField is not enabled for user interaction")
        
        // Last Name textfield
        XCTAssertTrue(lastNameTextField.isEnabled, "lastNameTextField is not enabled for user interaction")

        // Email textfield
        XCTAssertTrue(emailTextField.isEnabled, "emailTextField is not enabled for user interaction")
        
        // Password textfield
        XCTAssertTrue(passwordTextField.isEnabled, "passwordTextField is not enabled for user interaction")
        
        // Confirm Password textfield
        XCTAssertTrue(confirmPasswordTextField.isEnabled, "confirmPasswordTextField is not enabled for user interaction")
        
        // Confirm Password textfield
        XCTAssertTrue(submitButton.isEnabled, "confirmPasswordTextField is not enabled for user interaction")
    }

    func testExample() {
        // First Name textfield
        firstNameTextField.tap()
        firstNameTextField.typeText("Hemant")
        
        // Last Name textfield
        lastNameTextField.tap()
        lastNameTextField.typeText("Soni")
        
        // Email Name textfield
        emailTextField.tap()
        emailTextField.typeText("sonihemant111@gmail.com")
        
        // Password Name textfield
        passwordTextField.tap()
        passwordTextField.typeText("1234567891")
        
        // Confirm Password Name textfield
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("1234567891")
        
        // Confirm Password Name textfield
        submitButton.tap()
    }

}
