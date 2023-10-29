//
//  ViewCode.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation
import UIKit

public protocol ViewCode {
    func initViewCode()
    func configureSubViews()
    func configureConstraints()
    func configureAdditionalBehaviors()
    func configureAccessibility()
}

public extension ViewCode {
    func initViewCode() {
        configureSubViews()
        configureConstraints()
        configureAdditionalBehaviors()
        configureAccessibility()
    }
}
