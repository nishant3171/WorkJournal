//
//  CustomLogin.swift
//  PW Journal
//
//  Created by nishant punia on 08/02/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit

class CustomLogin: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 2.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowColor = UIColor(red: _shadowColor, green: _shadowColor, blue: _shadowColor, alpha: 0.8).CGColor
    }

}
