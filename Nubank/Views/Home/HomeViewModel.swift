//
//  HomeViewModel.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var shortcuts: Shortcuts = [
        Shortcut(space: ItemSpace(edge: .leading, distance: 16)),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: nil),
        Shortcut(space: ItemSpace(edge: .trailing, distance: 16))
    ]
    
    @Published var highlights: Highlights = [
        Highlight(text: "Você tem até R$ 25.000,00 disponiveis para empréstimo.", space: ItemSpace(edge: .leading, distance: 16)),
        Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: nil),
        Highlight(text: "Tem SHOPPING no seu bank, Conheça agora.", space: ItemSpace(edge: .trailing, distance: 16))
    ]
}
