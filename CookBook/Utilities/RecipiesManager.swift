import Foundation

final class RecipiesManager {
    static let shared = RecipiesManager()
    private init() {}
    var recipies = Set<RecipeStruct>()
}
