//
//  OrientationItemController.swift
//  FakeNews
//
//  Created by Henrique Marques on 18/11/23.
//

import UIKit

class OrientationItemController: UIViewController {
    
    var orientationItem: OrientationModel?
    var orientationView: OrientationItemView?
    
    override func loadView() {
        self.orientationView = OrientationItemView()
        self.view = orientationView
    }
    
    init(orientationItem: OrientationModel) {
        self.orientationItem = orientationItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orientationView?.infoNameLabel.text = orientationItem?.orientationTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
        self.configPermitedView()
        self.notconfigPermitedView()
//        self.configNavigationController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    func configNavigationController() {
//        if let navigationController = self.navigationController {
//                navigationController.navigationBar.isTranslucent = true
//                navigationController.navigationBar.barTintColor = UIColor.clear
//                navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//                navigationController.navigationBar.shadowImage = UIImage()
//        }
//    }
    
    func configPermitedView() {
        if ((self.orientationItem?.permitido?.info?.isEmpty) != nil)  {
            
            self.orientationView?.infoStackView.addArrangedSubview(self.orientationView?.permitedInfoView ?? UIView())
            
            self.orientationView?.permitedInfoStackView.addArrangedSubview(self.orientationView?.permitedLabel ?? UIView())
            self.orientationView?.permitedInfoStackView.addArrangedSubview(self.orientationView?.infoPermited ?? UIView())
            self.orientationView?.infoPermited.text = orientationItem?.permitido?.info
        } else {
            print("Vazio")
        }
    }
    
    func notconfigPermitedView() {
        if ((self.orientationItem?.proibido?.info?.isEmpty) != nil)  {
            
            self.orientationView?.infoStackView.addArrangedSubview(self.orientationView?.notpermitedInfoView ?? UIView())
            
            self.orientationView?.notpermitedInfoStackView.addArrangedSubview(self.orientationView?.notpermitedLabel ?? UIView())
            self.orientationView?.notpermitedInfoStackView.addArrangedSubview(self.orientationView?.notinfoPermited ?? UIView())
            self.orientationView?.notinfoPermited.text = orientationItem?.proibido?.info
        } else {
            print("Vazio")
        }
    }
}
