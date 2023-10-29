//
//  HomeModel.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import Foundation

struct HomeModel: Codable {
    let SectionName: String?
}

struct NewsModel: Codable {
    let newsTitle: String?
    let newsProvider: String?
    let newsDescription: String?
    let newsDate: String?
    let newsImage: String?
}
