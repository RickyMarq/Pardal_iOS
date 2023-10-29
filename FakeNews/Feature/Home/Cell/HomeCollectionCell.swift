//
//  HomeCollectionCell.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit
import SkeletonView

class HomeCollectionCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionCell"
    
    lazy var titleCollectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
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

extension HomeCollectionCell: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.titleCollectionLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.titleCollectionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleCollectionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        self.isSkeletonable = true
        self.backgroundColor = .secondarySystemBackground
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
    }
    
    func configureAccessibility() {
        
    }

}
