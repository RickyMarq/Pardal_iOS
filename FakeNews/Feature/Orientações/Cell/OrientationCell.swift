//
//  OrientationCell.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import UIKit

class OrientationCell: UICollectionViewCell {
    
    static let identifier = "OrientationCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var orientationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
      //  imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        return imageView
    }()
    
}

extension OrientationCell: ViewCode {
  
    func configureSubViews() {
        self.addSubview(self.orientationLabel)
        self.addSubview(self.iconImageView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 42),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 42),
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            
            self.orientationLabel.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 4),
            self.orientationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            self.orientationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
        
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
    }
    
    func configureAccessibility() {
        
    }
}
