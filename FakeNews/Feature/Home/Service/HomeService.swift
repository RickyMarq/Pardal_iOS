//
//  HomeService.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation

protocol HomeServiceProtocol: AnyObject {
    func getSection(completion: @escaping (Result<[HomeModel]?, Error>) -> Void)
    func getNews(completion: @escaping (Result<[NewsModel]?, Error>) -> Void)
}

class HomeService: HomeServiceProtocol {
   
    func getNews(completion: @escaping (Result<[NewsModel]?, Error>) -> Void) {
        guard let url = URL(string: "https://fake-news-api-beige.vercel.app/getNews") else {return}
        
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([NewsModel].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
   
    func getSection(completion: @escaping (Result<[HomeModel]?, Error>) -> Void) {
        guard let url = URL(string: "https://fake-news-api-beige.vercel.app/getSection") else {return}
        
        let session = URLSession.shared
        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([HomeModel].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
