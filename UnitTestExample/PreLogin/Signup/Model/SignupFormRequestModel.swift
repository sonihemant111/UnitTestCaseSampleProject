//
//  SignupRequestModel.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
