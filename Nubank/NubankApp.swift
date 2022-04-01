//
//  NubankApp.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import SwiftUI

@main
struct NubankApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(HomeViewModel(homeModel: homeModel))
        }
    }
    
    var homeModel: HomeModel {
        guard let url = Bundle.main.url(forResource: "home", withExtension: "json"),
              let data = try? Data(contentsOf: url, options: .mappedIfSafe),
              var response = try? JSONDecoder().decode(HomeModel.self, from: data),
              var firstShortcut = response.shortcuts.first,
              var secondShortcut = response.shortcuts.last,
              var firstHighlight = response.highlights.first,
              var lastHighlight = response.highlights.last else { fatalError() }
        
        firstShortcut.space = ItemSpace(edge: .leading, distance: 16)
        secondShortcut.space = ItemSpace(edge: .trailing, distance: 16)
        
        response.shortcuts.replaceSubrange(0...0, with: [firstShortcut])
        response.shortcuts.replaceSubrange(response.shortcuts.count - 1...response.shortcuts.count - 1, with: [secondShortcut])
        
        firstHighlight.space = ItemSpace(edge: .leading, distance: 16)
        lastHighlight.space = ItemSpace(edge: .trailing, distance: 16)
        
        response.highlights.replaceSubrange(0...0, with: [firstHighlight])
        response.highlights.replaceSubrange(response.highlights.count - 1...response.highlights.count - 1, with: [lastHighlight])
        
        return response
    }
}
