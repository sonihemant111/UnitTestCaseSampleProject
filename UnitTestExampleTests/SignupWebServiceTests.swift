//
//  SignupWebServiceTests.swift
//  UnitTestExampleTests
//
//  Created by Hemant Soni on 3/17/21.
//  Copyright © 2021 None. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class SignupWebServiceTests: XCTestCase {

    var sut:SignupWebService!
    var signupFormRequestModel:SignupFormRequestModel!
    var objUrl = URLManager.init()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        NetworkManager.main.setMockSession(session: urlSession)
        sut = SignupWebService()
        signupFormRequestModel = SignupFormRequestModel(firstName: "Hemant Soni", lastName: "Soni", email: "test@test.com", password: "12345678")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel, url: objUrl.signup) { (signupResponseModel, error) in
            // Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signupFormRequestModel, url: objUrl.signup) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignupWebService()
        
        // Act
        sut.signup(withForm: signupFormRequestModel, url: "") { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
         self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // Act
        sut.signup(withForm: signupFormRequestModel, url: objUrl.signup) { (signupResponseModel, error) in
            // Assert
            XCTAssertNil(signupResponseModel, "This model must be nill as the request will fail ")
            XCTAssertNotNil(error, "Error Must not be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
}
