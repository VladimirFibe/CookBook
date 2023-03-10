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
        let main = try await RecipeHTTPClient.shared.mainFetch()
        sendEvent(.didLoadSections(main))
    }
}
