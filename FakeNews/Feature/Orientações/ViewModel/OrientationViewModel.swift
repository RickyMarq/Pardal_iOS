//
//  OrientationViewModel.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import Foundation

protocol OrientationViewModelProtocol: AnyObject {
    func success()
    func failure(error: String)
}

class OrientationViewModel {
    
    weak var delegate: OrientationViewModelProtocol?
    let services: OrientationServices?
    var orientationObjc: [OrientationModel] = []

    init(services: OrientationServices) {
        self.services = services
    }
    
    func delegate(delegate: OrientationViewModelProtocol) {
        self.delegate = delegate
    }
    
    func getOrientations() {
        services?.getOrientations { result in
            
            switch result {
                
            case .success(let data):
                print(data)
                self.orientationObjc = data ?? []
                self.delegate?.success()
            case .failure(let error):
                self.delegate?.failure(error: error.localizedDescription)
            }
        }
    }
    
    var count: Int {
        return orientationObjc.count
    }
    
    func indexPath(indexPath: IndexPath) -> OrientationModel {
        return orientationObjc[indexPath.row]
    }
}
