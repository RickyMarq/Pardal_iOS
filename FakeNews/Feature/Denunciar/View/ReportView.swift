//
//  ReportView.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit

protocol ReportViewProtocol: AnyObject {
    func reportInternet()
    func reportAd()
}

class ReportView: UIView {
    
    weak var delegate: ReportViewProtocol?
    
    func delegate(delegate: ReportViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Selecione qual tipo de irregularidade deseja denunciar."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    lazy var reportAdButton: UIButton = {
        let button = UIButton()
        button.setTitle("Propaganda eleitoral irregular", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.systemBackground.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 1.5
        button.layer.shadowOpacity = 1
        button.layer.masksToBounds = false
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: -1, height: 0)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1.5
        button.addTarget(self, action: #selector(reportAdButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func reportAdButtonTapped() {
        self.delegate?.reportAd()
    }
    
    lazy var titleDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.text = "Toda e qualquer publicidade relativa às eleições, expressamente vedada pela Lei n 9.504/97, seja uma razão de sua forma. O aplicativo Pardal não recebe denúncias referentes à propaganda na internet, as quais devem ser informadas diretamente ao Ministério Publico. Para isso, utiliza a opção 'Outras Irregularidades Eleitorais', com o direcionamento do link do Ministério Público do seu estado."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var reportInternet: UIButton = {
        let button = UIButton()
        button.setTitle("Internet e outras irregularidades eleitorais", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.systemBackground.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 1.5
        button.layer.shadowOpacity = 1
        button.layer.masksToBounds = false
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: -1, height: 0)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1.5
        button.addTarget(self, action: #selector(reportInternt), for: .touchUpInside)
        return button
    }()
   
    @objc func reportInternt() {
        self.delegate?.reportInternet()
    }
    
    
    lazy var titleInternetDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.text = "Práticas verdadas pela legislação eleitoral, tais como captação ilicita de sufrágio (compra de voto), abuso de poder econômico, abuso de poder político e condutas vedadas (uso de máquina pública para fins eleitorais), uso indevido dos meios de comunicação social e crimes eleitorias. A apuração dessas irregularidades compete ao Ministério Público Eleitoral."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    
    
//    lazy var reportTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .insetGrouped)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    public func reportTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
//        self.reportTableView.delegate = delegate
//        self.reportTableView.dataSource = dataSource
//    }

}

extension ReportView: ViewCode {
    
    func configureSubViews() {
  //      self.addSubview(self.reportTableView)
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        self.contentStackView.addArrangedSubview(self.titleLabel)
        self.contentStackView.addArrangedSubview(self.reportAdButton)
        self.contentStackView.addArrangedSubview(self.titleDataLabel)
        self.contentStackView.addArrangedSubview(self.reportInternet)
        self.contentStackView.addArrangedSubview(self.titleInternetDataLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
//            self.reportTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            self.reportTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            self.reportTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
//            self.reportTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            
            self.contentStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.contentStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            self.reportAdButton.widthAnchor.constraint(equalToConstant: 350),
            self.reportInternet.widthAnchor.constraint(equalToConstant: 350),
            
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
        
}
