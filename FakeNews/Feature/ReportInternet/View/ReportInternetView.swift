//
//  ReportInternetView.swift
//  FakeNews
//
//  Created by Henrique Marques on 23/11/23.
//

import UIKit

protocol ReportInternetViewProtocol: AnyObject {
    func reportAction()
}

class ReportInternetView: UIView {
    
    weak var delegate: ReportInternetViewProtocol?
    
    func delegate(delegate: ReportInternetViewProtocol) {
        self.delegate = delegate
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    
    lazy var intenertDataTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Internet e outras irregularidades eleitorais"
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 27, weight: .heavy)
        return label
    }()
    
    lazy var intenertDataInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Para a comunicação de outras irregularidades eleitorais, as denúncias devem ser feitas diretamente perante o órgão do Ministério Público Eleitoral como atuação no estado onde ocorreu o fato. Caso queria que seus dados sejam tratados com sigilo, é importante registrar esta opção diretamente na página do Ministério Público para qual você será direcionado. \nConfira Abaixo:"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = picker
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 10
        textField.enablesReturnKeyAutomatically = true
  //      let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 28))
  //      textField.leftView = leftPaddingView
  //      textField.leftViewMode = .always
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("Denunciar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.isEnabled = false
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
        button.addTarget(self, action: #selector(reportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func reportButtonTapped() {
        self.delegate?.reportAction()
    }
    
    func updateReportButton(enabled: Bool) {
        reportButton.isEnabled = enabled
        if enabled {
            reportButton.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        } else {
            reportButton.backgroundColor = .gray
        }
    }
    
    public func pickerDelegate(delegate: UIPickerViewDelegate, dataSource: UIPickerViewDataSource) {
        self.picker.delegate = delegate
        self.picker.dataSource = dataSource
    }

}

extension ReportInternetView: ViewCode {
  
    func configureSubViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        self.contentStackView.addArrangedSubview(self.intenertDataTitle)
        self.contentStackView.addArrangedSubview(self.intenertDataInfo)
        self.contentView.addSubview(self.pickerTextField)
        self.contentView.addSubview(self.reportButton)
 //       self.contentStackView.addArrangedSubview(self.reportButton)
 //       self.contentView.addSubview(self.picker)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
        
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
        //    self.contentStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
//            self.pickerTextField.widthAnchor.constraint(equalToConstant: 350),
//            self.pickerTextField.heightAnchor.constraint(equalToConstant: 20),
            
            self.pickerTextField.topAnchor.constraint(equalTo: self.contentStackView.bottomAnchor, constant: 12),
            self.pickerTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.pickerTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            self.reportButton.topAnchor.constraint(equalTo: self.pickerTextField.bottomAnchor, constant: 50),
            self.reportButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.reportButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            self.reportButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -50),
            
        
//            self.picker.topAnchor.constraint(equalTo: self.contentStackView.bottomAnchor, constant: 8),
//            self.picker.leadingAnchor.constraint(equalTo: self.contentStackView.leadingAnchor),
//            self.picker.trailingAnchor.constraint(equalTo: self.contentStackView.trailingAnchor),
//            self.picker.heightAnchor.constraint(equalToConstant: 150),
            
   //         self.picker.widthAnchor.constraint(equalToConstant: 300),
        
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
    
}
