//
//  SignupFormViewModelTests.swift
//  UnitTestExampleTests
//
//  Created by hemant on 3/18/21.
//  Copyright © 2021 None. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class SignupFormViewModelTests: XCTestCase {
    private var signupViewModel: SignupViewModel?
//    private var mockValidator = MockSignupFormModelValidator()
    private var mockValidator = SignupFormModelValidator()

    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        NetworkManager.main.setMockSession(session: urlSession)
        
        signupViewModel = SignupViewModel(mockValidator)
    }
    
    override func tearDown() {
        signupViewModel = nil
    }

    func testSignupViewModel_ProcessSignup() {
        let signupModel = SignupFormModel(firstName: "Hemant", lastName: "Soni", email: "sonihemant111@gmail.com", password: "1234567891", confirmPassword: "1234567891")
        if let resultType = signupViewModel?.processUserSignup(formModel: signupModel) {
            XCTAssertNotEqual(resultType, .invalidFirstName, "Entered first name is invalid")
            XCTAssertNotEqual(resultType, .invalidLastName, "Entered last name is invalid")
            XCTAssertNotEqual(resultType, .invalidEmail, "Entered email is invalid")
            XCTAssertNotEqual(resultType, .invalidPassword, "Entered password must be minimum 8 characters and maximum 16 characters long")
            XCTAssertNotEqual(resultType, .passwordConfirmPasswordNotMatch, "Entered password and confirm password is not same")
            XCTAssertEqual(resultType, .none, "Provided information has entered all valid")
        }
    }
    
}
