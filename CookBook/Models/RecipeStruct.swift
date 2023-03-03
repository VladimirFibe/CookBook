//
//  Recipe.swift
//  CookBook
//
//  Created by Aleksandr Kan on 01/03/23.
//

import Foundation

struct RecipeStruct: Codable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

//MARK: - Favorites recipes

struct FavoritesRecipe: Codable {
    var results: [RecipeStruct]
}

