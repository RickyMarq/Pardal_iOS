//
//  OrientationModel.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import Foundation

struct OrientationModel: Codable {
    let orientationTitle: String?
    let orientationImage: String?
    let permitido: Permitido?
    let proibido: Proibido?
    let height: Int?
    let width: Int?
}

struct Permitido: Codable {
    let info: String?
}

struct Proibido: Codable {
    let info: String?
}
