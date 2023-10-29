//
//  Compositional+Enum.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation
import UIKit

enum HomeLayoutEnum {
    case largeSection
    case genreSection
    
    
    func getLayout(withHeader: Bool = true) -> NSCollectionLayoutSection {
        switch self {
            
        case .largeSection:
            HomeCompositionalLayout.sharedObjc.largeSectionLayout(withHeader: withHeader)
            
            
        case .genreSection:
            HomeCompositionalLayout.sharedObjc.genreVerticalLayout(withHeader: withHeader)
        }
    }
}
