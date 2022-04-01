//
//  Spacable.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import UIKit

protocol Spacable {
    var space: ItemSpace? { get }
    
    func getSpace(for edge: ItemSpaceEdge) -> CGFloat
}

extension Spacable {
    func getSpace(for edge: ItemSpaceEdge) -> CGFloat {
        guard let space = space, edge == space.edge else { return 0 }
        return space.distance
    }
}
