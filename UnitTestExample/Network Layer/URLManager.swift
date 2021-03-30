//
//  URLManager.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

class URLManager {
    private let baseURL: String = "http://appsdeveloperblog.com:8080/signup-mock-service/users"
    var signup: String {
        return baseURL + "signup"
    }
}
