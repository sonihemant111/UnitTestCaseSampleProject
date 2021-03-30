//
//  SignupViewController.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as? SignupView {
            view.delegate = self
            view.setAccessibilityIdentifier()
        }
    }
}

// For Alert Messages
extension SignupViewController {
    /// display alert
    /// - Parameters:
    ///   - message::for alert message
    func showAlert(message: String) {
        let alertView = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
        }))
        self.present(alertView, animated: true, completion: nil)
    }
}

// Extension for SignupViewProtocol
extension SignupViewController: SignupViewProtocol {
    @objc func view(didPerformAction action: Any, userInfo: Any?) {
        if let action = action as? SignupViewAction {
            if action == .showAlert {
                self.showAlert(message: (userInfo as? String) ?? "")
            }
        }
    }
}

