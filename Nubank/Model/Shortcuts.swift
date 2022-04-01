//
//  Shortcuts.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation

typealias Shortcuts = [Shortcut]

struct Shortcut: Hashable, Spacable {
    let space: ItemSpace?
}
