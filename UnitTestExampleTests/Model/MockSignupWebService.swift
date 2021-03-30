//
//  MockSignupWebService.swift
//  UnitTestExampleTests
//
//  Created by hemant on 3/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
@testable import UnitTestExample

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, url: String, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful."))
        } else {
            let responseModel = SignupFormResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
        
    }
    
}
