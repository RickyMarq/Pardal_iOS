//
//  OrientationServices.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import Foundation

protocol OrientationServicesProtocol: AnyObject {
    func getOrientations(completion: @escaping (Result<[OrientationModel]?, Error>) -> Void)
}

class OrientationServices: OrientationServicesProtocol {
    
    func getOrientations(completion: @escaping (Result<[OrientationModel]?, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/getOrientation") else {return}
        
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([OrientationModel].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    
}
