//
//  DenunciarController.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit

class DenunciarController: UIViewController {
    
    var reportView: ReportView?
    var viewModel: ReportViewModel?
    
    override func loadView() {
        self.reportView = ReportView()
        self.view = reportView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ReportViewModel()
        self.configNavigationAppearanceController()
  //      self.reportView?.reportTableViewProtocols(delegate: self, dataSource: self)
        self.reportView?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configNavigationAppearanceController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }
    
    func configNavigationAppearanceController() {
        self.title = "Denunciar"
        self.navigationItem.title = "Denunciar"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

extension DenunciarController: ReportViewProtocol {
  
    func reportInternet() {
        let vc = ReportInternetController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func reportAd() {
        let vc = CreateReportController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


//extension DenunciarController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel?.rowsInSection(section: section) ?? 0
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel?.numberOfSections ?? 0
//
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell.init()
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return viewModel?.titleForSection(section: section)
//    }
//    
//}
