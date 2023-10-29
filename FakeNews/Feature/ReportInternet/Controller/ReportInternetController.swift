//
//  ReportInternetController.swift
//  FakeNews
//
//  Created by Henrique Marques on 23/11/23.
//

import UIKit

class ReportInternetController: UIViewController {
    
    var reportInternetView: ReportInternetView?
    var data = ["Acre", "Alagoas", "Mato Grosso", "Amapá", "Amazonas", "Bahia", "Ceará", "Destrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins", "Distrito Federal"]
    
    override func loadView() {
        self.reportInternetView = ReportInternetView()
        self.view = reportInternetView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reportInternetView?.pickerDelegate(delegate: self, dataSource: self)
        self.configNavigationAppearanceController()
        self.reportInternetView?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configNavigationAppearanceController()
        self.reportInternetView?.updateReportButton(enabled: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configNavigationAppearanceController() {
//        self.title = "Denunciar"
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.tintColor = .white

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

extension ReportInternetController: ReportInternetViewProtocol {
    
    func reportAction() {
        print("Action.....")
        guard let url = URL(string: "https://sis.mpsp.mp.br/atendimentocidadao/Promotorias/Manifestacao/EscolherTipoDeIdentificacao") else {return}
        UIApplication.shared.open(url)
    }
    
}

extension ReportInternetController: UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.reportInternetView?.pickerTextField.text = data[row]
        self.reportInternetView?.pickerTextField.resignFirstResponder()
        self.reportInternetView?.updateReportButton(enabled: true)
    }
}
