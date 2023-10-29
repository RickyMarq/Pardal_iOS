//
//  OrientaçõesView.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class OrientationView: UIView {
    
    var layoutPintrest = PinterestLayout()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var orientationCollectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.setContentOffset(CGPoint.zero, animated: false)
//        layoutPintrest.contentPadding = PinterestLayout.Padding(horizontal: 5, vertical: 5)
//        layoutPintrest.cellsPadding = PinterestLayout.Padding(horizontal: 10, vertical: 10)
//        layoutPintrest.columnsCount = 2
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        collectionView.reloadData()
        collectionView.register(OrientationCell.self, forCellWithReuseIdentifier: OrientationCell.identifier)
        return collectionView
    }()
    
    public func layoutDelegate(delegate: PinterestLayoutDelegate) {
        self.layoutPintrest.delegate = delegate
    }
    
    public func oritationCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.orientationCollectionView.delegate = delegate
        self.orientationCollectionView.dataSource = dataSource
    }

}

extension OrientationView: ViewCode {
    
    func configureSubViews() {
        self.addSubview(self.orientationCollectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
        
            self.orientationCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.orientationCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.orientationCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.orientationCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
    
}
