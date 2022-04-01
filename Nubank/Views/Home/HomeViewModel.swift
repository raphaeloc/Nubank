//
//  HomeViewModel.swift
//  Nubank
//
//  Created by Raphael de Oliveira Chagas on 31/03/22.
//

import Foundation
import Combine

enum CardType {
    case creditCard
    case loan
    case investments
    case insurance
    case shopping
}

class HomeViewModel: ObservableObject {
    
    @Published var homeModel: HomeModel
    @Published var cardTypes: [CardType] = [
        .creditCard,
        .loan,
        .investments,
        .insurance,
        .shopping
    ]
    
    init(homeModel: HomeModel) {
        self.homeModel = homeModel
    }
    
    func fetchHomeModel() {
        guard let url = Bundle.main.url(forResource: "home", withExtension: "json"),
              let data = try? Data(contentsOf: url, options: .mappedIfSafe),
              let response = try? JSONDecoder().decode(HomeModel.self, from: data) else { return }
        
        homeModel = response
    }
}
