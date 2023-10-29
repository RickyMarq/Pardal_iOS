//
//  HomeViewModel.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func failure(error: String)
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelProtocol?
    var services: HomeService
    var sectionData = [HomeModel]()
    var newsData = [NewsModel]()
    
    init(services: HomeService) {
        self.services = services
    }
    
    func delegate(delegate: HomeViewModelProtocol) {
        self.delegate = delegate
    }
    
    func getSectionData() {
        services.getSection { result in
            
            switch result {
     
            case .success(let model):
                print(model)
                self.sectionData = model ?? []
                self.delegate?.success()
            case .failure(let error):
                self.delegate?.failure(error: error.localizedDescription)
            }
        }
    }
    
    func getNewsData() {
        services.getNews { result in
            switch result {
            case .success(let model):
                print(model)
                self.newsData = model ?? []
                self.delegate?.success()
            case .failure(let error):
                self.delegate?.failure(error: error.localizedDescription)
            }
        }
    }
    
    var sectionCount: Int {
        return sectionData.count
    }
    
    func indexPath(indexPath: IndexPath) -> HomeModel {
        return sectionData[indexPath.row]
    }
    
    var newsCount: Int {
        return newsData.count
    }
    
    func newsindexPath(indexPath: IndexPath) -> NewsModel {
        return newsData[indexPath.row]
    }
}
