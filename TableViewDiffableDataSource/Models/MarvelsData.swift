//
//  MarvelsData.swift
//  TableViewDiffableDataSource
//
//  Created by Ashish Tyagi on 05/05/21.
//

import Foundation

struct CharactersData: Hashable {
    let id: Int
    let name: String
    let image: String
    var power: String?
}

struct Character: Hashable {
    var id: Int
    var comicCharacters: [CharactersData]
    var type: SectionData
}

enum SectionData: String, CaseIterable {
    case marvel = "Marvel Universe"
    case dc     = "DC Universe"
}
