//
//  MyButton.swift
//  UnitTestExample
//
//  Created by Hemant Soni on 3/15/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIButton {

    /// Applied Corner radius with the specified value
    @IBInspectable var cornerRadius: Double = 0.0 {
        didSet {
            self.layer.cornerRadius = CGFloat(cornerRadius)
        }
    }

}
