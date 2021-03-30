//
//  SignupWebServiceProtocol.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, url: String, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void)
}
