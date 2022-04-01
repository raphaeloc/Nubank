//
//  ItemSpace.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import UIKit

enum ItemSpaceEdge: Hashable {
    case leading
    case trailing
}

struct ItemSpace: Hashable {
    let edge: ItemSpaceEdge
    let distance: CGFloat
}
