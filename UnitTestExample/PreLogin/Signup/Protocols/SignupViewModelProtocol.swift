//
//  SignupViewModelProtocol.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

enum InvalidEntry {
    case invalidFirstName
    case invalidLastName
    case invalidPassword
    case invalidEmail
    case passwordConfirmPasswordNotMatch
    case none
}

protocol SignupViewModelProtocol: class {
    func success()
    func didReceiveError(error: Error?)
}
