//
//  SignupWebService.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

struct SignupWebService {
    private let request = RequestManager()
}

extension SignupWebService: SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, url: String, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        guard let signupUrl = URL(string: url) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        request.get(with: signupUrl) { (data, error) in
            // encode the response
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data=data, let signupResponseModel = try? JSONDecoder().decode(SignupFormResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
    }
}
