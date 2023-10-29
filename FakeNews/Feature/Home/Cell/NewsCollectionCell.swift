//
//  NewsCollectionCell.swift
//  FakeNews
//
//  Created by Henrique Marques on 02/11/23.
//

import UIKit
import SDWebImage
import SkeletonView

class NewsCollectionCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionCell"
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.roundCorners([.topLeft, .topRight], radius: 12.0)
        return imageView
    }()
    
    lazy var newsProviderLabel: UILabel = {
        let label = UILabel()
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        label.skeletonTextNumberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var newsNameLabel: UILabel = {
        let label = UILabel()
//        label.isSkeletonable = true
//        label.linesCornerRadius = 7
//        label.skeletonTextNumberOfLines = 2
//        label.skeletonLineSpacing = 2.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        label.skeletonTextNumberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var newsDateLabel: UILabel = {
        let label = UILabel()
        label.isSkeletonable = true
        label.linesCornerRadius = 7
        label.skeletonTextNumberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 14)
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

extension NewsCollectionCell: ViewCode {
   
    func configureSubViews() {
        self.addSubview(self.newsImageView)
        self.addSubview(self.newsProviderLabel)
        self.addSubview(self.newsNameLabel)
        self.addSubview(self.newsDescriptionLabel)
        self.addSubview(self.newsDateLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.newsImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.newsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.newsImageView.heightAnchor.constraint(equalToConstant: 200),
            
            self.newsProviderLabel.topAnchor.constraint(equalTo: self.newsImageView.bottomAnchor, constant: 8),
            self.newsProviderLabel.leftAnchor.constraint(equalTo: self.newsNameLabel.leftAnchor),
            self.newsProviderLabel.rightAnchor.constraint(equalTo: self.newsNameLabel.rightAnchor),
            
            self.newsNameLabel.topAnchor.constraint(equalTo: self.newsProviderLabel.bottomAnchor, constant: 8),
            self.newsNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            self.newsNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            
            self.newsDescriptionLabel.topAnchor.constraint(equalTo: self.newsNameLabel.bottomAnchor, constant: 8),
            self.newsDescriptionLabel.leftAnchor.constraint(equalTo: self.newsNameLabel.leftAnchor),
            self.newsDescriptionLabel.rightAnchor.constraint(equalTo: self.newsNameLabel.rightAnchor),
            self.newsDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),

            self.newsDateLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            self.newsDateLabel.leftAnchor.constraint(equalTo: self.newsDescriptionLabel.leftAnchor),
            self.newsDateLabel.rightAnchor.constraint(equalTo: self.newsDescriptionLabel.rightAnchor),
            
        ])
    }
    
    func configureAdditionalBehaviors() {
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
