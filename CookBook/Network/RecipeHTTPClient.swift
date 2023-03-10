import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

final class RecipeHTTPClient {
    static let shared = RecipeHTTPClient()
    let apiKey = "a67a5241c34f45429f75c2d8a1858a67"
    let baseURL = "https://api.spoonacular.com/"
    private init() {}
    
    func makeRequest<T: Decodable>(
        path: String,
        params: [String: String] = [:]
    ) async throws -> T {
        var queryItems = [URLQueryItem(name: "apiKey", value: apiKey)]
        for (name, value) in params {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        var components = URLComponents(string: baseURL+path)
        components?.queryItems = queryItems
        guard let url = components?.url else { throw NetworkError.invalidURL }
        print(#function, url)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
        guard let recipeResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.decodingError }
        return recipeResponse
    }
    
    func getRecipe(id: Int) async throws -> Recipe {
        try await RecipeHTTPClient.shared.makeRequest(path: "recipes/\(id)/information")
    }
    
    func getRecipes() -> [Recipe] {
        let response = Bundle.main.decode(RecipeResponse.self, from: "Recipe.json")
        return response.recipes
    }
    
    func mainFetch() async throws -> MainContent {
        let recipe = try await getRecipe(id: 583757)
        print("______________")
        print(recipe)
        let trendingsResponse: RecipeResponse = try await makeRequest(
            path: "recipes/random",
            params: ["number": "10"])
        let popularResponse: ResipesResult = try await makeRequest(
            path: "recipes/complexSearch",
            params: ["sort": "popularity", "number": "10", "type": "breakfast"])
        let trendings = trendingsResponse.recipes
        let populars = popularResponse.results
        let recents: [Recipe] = trendings.reversed()
        let chefs: [String] = ["@alx_kkn", "@SHegor74", "@giicom", "@kikreen", "@ag70707", "@klevzhits_igor", "@vasilii_v123", "@macservicekz"]
        return MainContent(trendings: trendings, populars: populars, recents: recents, chefs: chefs)
    }
}
