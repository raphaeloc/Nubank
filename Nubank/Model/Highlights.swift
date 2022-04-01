//
//  Highlights.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation

typealias Highlights = [Highlight]

struct Highlight: Codable, Hashable, Spacable {
    let text: String
    let space: ItemSpace?
}
