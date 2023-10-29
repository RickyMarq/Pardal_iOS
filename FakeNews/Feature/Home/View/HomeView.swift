//
//  HomeView.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit
import SkeletonView

protocol HomeViewProtocol: AnyObject {
    func searchRefreshAction()
}

class HomeView: UIView {
    
    weak var delegate: HomeViewProtocol?
    
    func delegate(delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isSkeletonable = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.refreshControl = searchRefreshControl
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        collectionView.register(NewsCollectionCell.self, forCellWithReuseIdentifier: NewsCollectionCell.identifier)
        collectionView.register(TitleHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeader.identifier)
        return collectionView
    }()
    
    lazy var searchRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.addTarget(self, action: #selector(searchRefreshInvoked), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func searchRefreshInvoked() {
        
    }
    
    public func homeCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.homeCollectionView.delegate = delegate
        self.homeCollectionView.dataSource = dataSource
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension HomeView: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.homeCollectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.homeCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.homeCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.homeCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.homeCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
    
}
