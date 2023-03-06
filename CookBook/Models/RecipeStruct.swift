import Foundation

struct RecipeStruct: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

//MARK: - Favorites recipes

struct FavoritesRecipe: Codable {
    var results: [RecipeStruct]
}
