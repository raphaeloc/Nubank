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
              let response = try? JSONDecoder().decode(HomeModel.self, from: data) else { fatalError() }
        
        return response
    }
}
