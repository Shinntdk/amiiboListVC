//
//  AmiiboEntity.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import Foundation

struct AmiiboList: Codable {
    let amiibo: [AmiiboEntity]
}

struct AmiiboEntity: Codable {
    let amiiboSeries: String
    let character, gameSeries, head: String
    let image: String
    let name: String
    let release: AmiiboRelease
    let tail: String
    let type: String
}

struct AmiiboRelease: Codable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}
