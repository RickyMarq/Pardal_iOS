//
//  HomeCompositionalLayout.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation
import UIKit

class HomeCompositionalLayout {
    
    static let sharedObjc = HomeCompositionalLayout()
    
    private init() {}
    
    func largeSectionLayout(withHeader: Bool = true) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(200), heightDimension: .absolute(100)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 10)

        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        if withHeader {
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        }
        return section
    }
    
    func genreVerticalLayout(withHeader: Bool = true) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))

         item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10)
         
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
         let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

         let section = NSCollectionLayoutSection(group: group)

         section.orthogonalScrollingBehavior = .none

         if withHeader {
             section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
         }
         return section
        
    }
    
}
