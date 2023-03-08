import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

final class RecipeHTTPClient {
    static let shared = RecipeHTTPClient()
    let apiKey = "a67a5241c34f45429f75c2d8a1858a67"
    private init() {}
    
    func getRandomRecipes(number: Int) async throws -> [Recipe] {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/random?number=\(number)") else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
        guard let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: data) else { throw NetworkError.decodingError }
        return recipeResponse.recipes
    }
    
    func getRecipes() -> [Recipe] {
        let response = Bundle.main.decode(RecipeResponse.self, from: "Recipe.json")
        return response.recipes
    }
}
