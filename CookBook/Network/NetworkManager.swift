import Foundation

class NetworkManager {

    func getFavoriteRecipe(completion: @escaping (Result<Data, Error>) -> Void) {
        let token = "ece93a7c094d40aea1db05c4b0a31a41"
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?sort=popularity&number=10") else { return }
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        request.addValue(token, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completion(.failure(error)) }
            if let dataResult = data { completion(.success(dataResult)) }
            
        }.resume()
    }
    
    func getRecipe(completion: @escaping (Result<Data, Error>) -> Void) {
        let token = "fdd3ba2292a349e995a408006056d6b6"
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/716440/information?includeNutrition=false") else { return }
        
        var request = URLRequest(url: url, timeoutInterval: .infinity)
        
        request.addValue(token, forHTTPHeaderField: "x-api-key")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let dataResult = data {
                completion(.success(dataResult))
            }
        }.resume()
    }
}
