//
//  Section.swift
//  FakeNews
//
//  Created by Henrique Marques on 30/10/23.
//

import Foundation
import UIKit

class ReportModel {
    
    var model = [Section]()
    
    func populateReport() -> [Section] {
        
        model.append(Section(titleOfSection: "Onde Aconteceu?", cell: [
        
            .staticCell(model: StaticCellModel(title: "", icon: UIImage(systemName: "") ?? UIImage(), iconBackgroundColor: .red, handler: { doubleHeader in
                
            }))
        
        ]))
        

        model.append(Section(titleOfSection: "", cell: [
        
        
        
        ]))
        
        return model
    }
    
}
