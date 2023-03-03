//
//  DataManager.swift
//  CookBook
//
//  Created by Aleksandr Kan on 01/03/23.
//

import Foundation

class DataManager {
    
    private let networkManager = NetworkManager()
    
    func getResults() {
        networkManager.getFavoriteRecipe { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                do {
                    let array = try JSONDecoder().decode(FavoritesRecipe.self, from: data)
                    print("TEST")
                    print(array)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
