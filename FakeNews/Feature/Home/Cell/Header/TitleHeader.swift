//
//  TitleHeader.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit

class TitleHeader: UICollectionReusableView {
    
    static let identifier = "UICollectionReusableView"
    
    lazy var titleCollectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
}

extension TitleHeader: ViewCode {
  
    func configureSubViews() {
        self.addSubview(self.titleCollectionLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.titleCollectionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            self.titleCollectionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
        ])
    }
    
    func configureAdditionalBehaviors() {
    }
    
    func configureAccessibility() {
        
    }
}
