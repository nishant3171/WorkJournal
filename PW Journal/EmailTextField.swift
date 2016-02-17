//
//  EmailTextField.swift
//  PW Journal
//
//  Created by nishant punia on 15/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit

class EmailTextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor(red: _shadowColor, green: _shadowColor, blue: _shadowColor, alpha: 0.1).CGColor
        layer.borderWidth = 1.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 0.0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 0.0)
    }

}
