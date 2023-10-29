//
//  CreateReportController.swift
//  FakeNews
//
//  Created by Henrique Marques on 26/11/23.
//

import UIKit

class CreateReportController: UIViewController {
    
    var createReportView: CreateReportView?
    
    override func loadView() {
        self.createReportView = CreateReportView()
        self.view = createReportView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
