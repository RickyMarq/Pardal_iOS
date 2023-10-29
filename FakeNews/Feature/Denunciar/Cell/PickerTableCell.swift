//
//  PickerTableCell.swift
//  FakeNews
//
//  Created by Henrique Marques on 30/10/23.
//

import UIKit

class PickerTableCell: UITableViewCell {
    
    lazy var picker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension PickerTableCell: ViewCode {
   
    func configureSubViews() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func configureAdditionalBehaviors() {
        
    }
    
    func configureAccessibility() {
        
    }
    
}
