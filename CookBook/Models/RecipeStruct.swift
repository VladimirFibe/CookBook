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

//MARK: - Favorites recipes

struct ResipesResult: Codable {
    var results: [RecipeStruct]
}
