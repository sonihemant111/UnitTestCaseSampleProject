//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import XCTest

class UnitTestExampleUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupView_WhenViewLoaded_RequiredElementsAreEnabled() {
        let app = XCUIApplication()
        
        // First Name textfield
        let firstNameTextField = app.textFields["firstNameTextField"]
        XCTAssertTrue(firstNameTextField.isEnabled, "firstNameTextField is not enabled for user interaction")
        
        // Last Name textfield
        let lastNameTextField = app.textFields["lastNameTextField"]
        XCTAssertTrue(lastNameTextField.isEnabled, "lastNameTextField is not enabled for user interaction")

        // Email textfield
        let emailTextField = app.textFields["emailTextField"]
        XCTAssertTrue(emailTextField.isEnabled, "emailTextField is not enabled for user interaction")
        
        // Password textfield
        let passwordTextField = app.textFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.isEnabled, "passwordTextField is not enabled for user interaction")
        
        // Confirm Password textfield
        let confirmPasswordTextField = app.textFields["confirmPasswordTextField"]
        XCTAssertTrue(confirmPasswordTextField.isEnabled, "confirmPasswordTextField is not enabled for user interaction")

        
        // Confirm Password textfield
        let submitButton = app.buttons["submitButton"]
        XCTAssertTrue(submitButton.isEnabled, "confirmPasswordTextField is not enabled for user interaction")
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        // First Name textfield
        let firstNameTextField = app.textFields["firstNameTextField"]
        firstNameTextField.tap()
        firstNameTextField.typeText("Hemant")
        
        // Last Name textfield
        let lastNameTextField = app.textFields["lastNameTextField"]
        lastNameTextField.tap()
        lastNameTextField.typeText("Soni")
        
        // Email Name textfield
        let emailTextField = app.textFields["emailTextField"]
        emailTextField.tap()
        emailTextField.typeText("sonihemant111@gmail.com")
        
        // Password Name textfield
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("1234567891")
        
        // Confirm Password Name textfield
        let confirmPasswordTextField = app.textFields["confirmPasswordTextField"]
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("1234567891")
        
        // Confirm Password Name textfield
        let submitButton = app.buttons["submitButton"]
        submitButton.tap()
    }

}
