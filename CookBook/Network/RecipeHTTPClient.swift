import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

final class RecipeHTTPClient {
    static let shared = RecipeHTTPClient()
    private init() {}
    
    func getProduct() async throws -> [Recipe] {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=a67a5241c34f45429f75c2d8a1858a67&number=8") else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
        guard let response = try? JSONDecoder().decode(RecipeResponse.self, from: data) else { throw NetworkError.decodingError }
        return response.recipes
    }
    
    func getRecipes() -> [Recipe] {
        let response = Bundle.main.decode(RecipeResponse.self, from: "Recipe.json")
        return response.recipes
    }
}
