import Foundation

enum Countries: String {
    case African, American, British, Cajun, Caribbean, Chinese, Eastern, European, French,
         German, Greek, Indian, Irish, Italian, Japanese, Jewish, Korean, Latin, Mediterranean,
         Mexican, Middle, Nordic, Southern, Spanish, Thai, Vietnamese
}


fileprivate struct ApiConstants {
    static let apiKey = "ece93a7c094d40aea1db05c4b0a31a41"
}


class NetworkManager {
    
    static let shared = NetworkManager()

    func getFavoriteRecipe(completion: @escaping (Result<ResipesResult, Error>) -> Void) {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?sort=popularity&number=10") else { return }
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(ApiConstants.apiKey, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error { completion(.failure(error)) }
            
            if let dataResult = data {
                do {
                    let recipes = try JSONDecoder().decode(ResipesResult.self, from: dataResult)
                    completion(.success(recipes))
                } catch let error {
                    completion(.failure(error))
                }
                
            }
            
        }.resume()
    }
    
    //Получение рецептов по категории стран
    func getCuisineCategories(for country: Countries, completion: @escaping (Result<ResipesResult, Error>) -> Void) {
        //guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?cuisine=/(country.rowValue)") else { return }
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?cuisine=Korean") else { return }
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(ApiConstants.apiKey, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error { completion(.failure(error)) }
            
            if let dataResult = data {
                do {
                    let recipes = try JSONDecoder().decode(ResipesResult.self, from: dataResult)
                    completion(.success(recipes))
                } catch let error {
                    completion(.failure(error))
                }
                
            }
            
        }.resume()
        
    }
    
    //Получение информации о рецепте по id
    func getInformationRecipe(for id: Int, completion: @escaping (Result<RecipeStruct, Error>) -> Void) {
        //guard let url = URL(string: "https://api.spoonacular.com/recipes//(id)/information") else { return }
        guard let url = URL(string: "https://api.spoonacular.com/recipes/665379/information") else { return }
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(ApiConstants.apiKey, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completion(.failure(error)) }
            if let dataResult = data {
                do {
                    let recipes = try JSONDecoder().decode(RecipeStruct.self, from: dataResult)
                    completion(.success(recipes))
                } catch let error {
                    completion(.failure(error))
                }
            }            
        }.resume()
    }
}
