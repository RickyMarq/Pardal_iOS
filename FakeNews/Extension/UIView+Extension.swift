//
//  UIView+Extension.swift
//  FakeNews
//
//  Created by Henrique Marques on 02/11/23.
//

import Foundation
import UIKit

extension UIView {
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        var cornerMask = CACornerMask()
        if(corners.contains(.topLeft)) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if(corners.contains(.topRight)) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if(corners.contains(.bottomLeft)) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if(corners.contains(.bottomRight)) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
}
