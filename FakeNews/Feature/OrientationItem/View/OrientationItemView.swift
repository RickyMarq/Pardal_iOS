//
//  OrientationItemView.swift
//  FakeNews
//
//  Created by Henrique Marques on 18/11/23.
//

import UIKit

class OrientationItemView: UIView {

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
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var infoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var permitedInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    lazy var permitedInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var permitedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "É permitido: "
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var infoPermited: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    lazy var notpermitedInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    lazy var notpermitedInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        return stackView
    }()
    
    lazy var notpermitedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "É Proibido: "
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var notinfoPermited: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
}

extension OrientationItemView: ViewCode {
   
    func configureSubViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.infoStackView)
        self.infoStackView.addArrangedSubview(self.infoNameLabel)
        
        self.permitedInfoView.addSubview(self.permitedInfoStackView)
        
        self.notpermitedInfoView.addSubview(self.notpermitedInfoStackView)
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
        
            
            self.infoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.infoStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.infoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.infoStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            self.permitedInfoStackView.topAnchor.constraint(equalTo: self.permitedInfoView.topAnchor, constant: 10),
            self.permitedInfoStackView.leadingAnchor.constraint(equalTo: self.permitedInfoView.leadingAnchor, constant: 12),
            self.permitedInfoStackView.trailingAnchor.constraint(equalTo: self.permitedInfoView.trailingAnchor, constant: -12),
            self.permitedInfoStackView.bottomAnchor.constraint(equalTo: self.permitedInfoView.bottomAnchor, constant: -10),
                        
            self.notpermitedInfoStackView.topAnchor.constraint(equalTo: self.notpermitedInfoView.topAnchor, constant: 10),
            self.notpermitedInfoStackView.leadingAnchor.constraint(equalTo: self.notpermitedInfoView.leadingAnchor, constant: 12),
            self.notpermitedInfoStackView.trailingAnchor.constraint(equalTo: self.notpermitedInfoView.trailingAnchor, constant: -12),
            self.notpermitedInfoStackView.bottomAnchor.constraint(equalTo: self.notpermitedInfoView.bottomAnchor, constant: -10),
        ])
    }
    
    func configureAdditionalBehaviors() {
        permitedInfoView.layer.cornerRadius = 10
        permitedInfoView.layer.shadowColor = UIColor.black.cgColor
        permitedInfoView.layer.shadowOpacity = 0.3
        permitedInfoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        permitedInfoView.layer.shadowRadius = 2
        
        notpermitedInfoView.layer.cornerRadius = 10
        notpermitedInfoView.layer.shadowColor = UIColor.black.cgColor
        notpermitedInfoView.layer.shadowOpacity = 0.3
        notpermitedInfoView.layer.shadowOffset = CGSize(width: 0, height: 2)
        notpermitedInfoView.layer.shadowRadius = 2
    }
    
    func configureAccessibility() {
        
    }
    
}
