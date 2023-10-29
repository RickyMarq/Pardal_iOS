//
//  SectionData.swift
//  FakeNews
//
//  Created by Henrique Marques on 30/10/23.
//

import Foundation
import UIKit

struct Section {
    let titleOfSection: String
    let cell: [CellType]
}

enum CellType {
    case staticCell(model: StaticCellModel)
}

struct StaticCellModel {
    let title: String
    let icon: UIImage
    let iconBackgroundColor: UIColor
    let handler: ((_ doubleHeader: String) -> Void)
}
