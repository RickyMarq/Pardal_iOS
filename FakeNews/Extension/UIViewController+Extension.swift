//
//  UIViewController+Extension.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/11/23.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    
    func openSafariPageWith(url: String) {
        let vc = SFSafariViewController(url: URL(string: url)!)
        vc.preferredControlTintColor = .white
        self.present(vc, animated: true)
    }

}
