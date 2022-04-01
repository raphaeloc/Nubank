//
//  ItemSpace.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import UIKit

enum ItemSpaceEdge: String, Codable, Hashable {
    case leading
    case trailing
}

struct ItemSpace: Codable, Hashable {
    let edge: ItemSpaceEdge
    let distance: CGFloat
}
