//
//  MockSignupViewModel.swift
//  UnitTestExampleTests
//
//  Created by hemant on 3/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
@testable import UnitTestExample

class MockSignupViewModel {
    var processUserSignupCalled: Bool = false
    
    private var mockFormModelValidator: SignupFormModelValidatorProtocol
    private lazy var webService = MockSignupWebService()
    var viewModelDelegate: SignupViewModelProtocol?
    
    init(_ validatorModel: SignupFormModelValidatorProtocol) {
        self.mockFormModelValidator = validatorModel
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
    
}
