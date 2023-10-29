//
//  ReportViewModel.swift
//  FakeNews
//
//  Created by Henrique Marques on 30/10/23.
//

import Foundation

class ReportViewModel {
    
    var reportData = ReportModel().populateReport()
    
    var numberOfSections: Int {
        return reportData.count
    }
    
    func rowsInSection(section: Int) -> Int {
        return reportData[section].cell.count
    }
    
    func titleForSection(section: Int) -> String {
        return reportData[section].titleOfSection 
    }
            
    func cellRowBySection(indexPath: IndexPath) -> CellType {
        return reportData[indexPath.section].cell[indexPath.row]
    }
    
}
