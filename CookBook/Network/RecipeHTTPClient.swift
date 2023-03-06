import Foundation

final class RecipeHTTPClient {
    static let shared = RecipeHTTPClient()
    private init() {}
    
    func getProduct() {
        Task {
            guard let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=a67a5241c34f45429f75c2d8a1858a67&number=8")
            else { return }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            print("---------")
            guard let response = try? JSONDecoder().decode(RecipeResponse.self, from: data) else { return }
            response.recipes.forEach {
                print($0.title)
            }
        }
    }
}
