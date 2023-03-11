import Foundation

enum MainEvent {
    case didLoadSections(MainContent)
}

enum MainAction {
    case fetch
}

final class MainStore: Store<MainEvent, MainAction> {
    override func handleActions(_ action: MainAction) {
        switch action {
        case .fetch:
            statefulCall(fetch)
        }
    }
    
    private func fetch() async throws {
        let main = try await mainFetch()
        sendEvent(.didLoadSections(main))
    }
    
    func mainFetch() async throws -> MainContent {
        let trendingsResponse: RecipeResponse = try await RecipeHTTPClient.shared.makeRequest(
            path: "recipes/random",
            params: ["number": "10"])
        let popularResponse: ResipesResult = try await RecipeHTTPClient.shared.makeRequest(
            path: "recipes/complexSearch",
            params: ["sort": "popularity", "number": "10", "type": "breakfast"])
        let trendings = trendingsResponse.recipes
        let populars = popularResponse.results
        let recents: [RecipeStruct] = trendings.reversed()
        let chefs = [
            RecipeStruct(id: 0, title: "alx_kkn", image: "https://avatarko.ru/img/kartinka/32/film_pirat_31050.jpg", imageType: "jpg"),
            RecipeStruct(id: 1, title: "SHegor74", image: "https://photoshablon.com/_ph/46/2/865486425.jpg?1678459719", imageType: "jpg"),
            RecipeStruct(id: 2, title: "giicom", image: "https://photoshablon.com/_ph/46/2/218949528.jpg?1678459904", imageType: "jpg"),
            RecipeStruct(id: 3, title: "kikreen", image: "https://photoshablon.com/_ph/46/2/220457423.jpg?1678459940", imageType: "jpg"),
            RecipeStruct(id: 4, title: "ag70707", image: "https://photoshablon.com/_ph/46/2/139276644.jpg?1678460346", imageType: "jpg"),
            RecipeStruct(id: 5, title: "klevzhits_igor", image: "https://photoshablon.com/_ph/46/2/371771960.jpg?1678460465", imageType: "jpg"),
            RecipeStruct(id: 6, title: "vasilii_v123", image: "https://photoshablon.com/_ph/46/2/772695716.jpg?1678460497", imageType: "jpg"),
            RecipeStruct(id: 7, title: "macservicekz", image: "https://photoshablon.com/_ph/46/2/2195982.jpg?1678460578", imageType: "jpg")]
        return MainContent(trendings: trendings, populars: populars, recents: recents, chefs: chefs)
    }
}
