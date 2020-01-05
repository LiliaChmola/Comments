//
//  UIView+Extension.swift
//  Comments
//
//  Created by Chmola Lilia on 1/5/20.
//  Copyright © 2020 Lilia Chmola. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - IBInspectable
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
