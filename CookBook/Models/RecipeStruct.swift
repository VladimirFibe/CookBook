import Foundation

struct RecipeStruct: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
    var bookmark: Bool {
        RecipiesManager.shared.recipies.contains(self)
    }
}

struct Ingredient {
    var name: String?
    var quantity: String?
}

//MARK: - Favorites recipes

struct ResipesResult: Codable {
    var results: [RecipeStruct]
}
