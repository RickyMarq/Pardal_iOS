//
//  CreateReportView.swift
//  FakeNews
//
//  Created by Henrique Marques on 26/11/23.
//

import UIKit

class CreateReportView: UIView {

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
        label.text = "Criar Denúncia"
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 27, weight: .heavy)
        return label
    }()
}

extension CreateReportView: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        self.contentStackView.addArrangedSubview(self.intenertDataTitle)
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
        
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
    
    
}
