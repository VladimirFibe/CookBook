// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeResponse = try? JSONDecoder().decode(RecipeResponse.self, from: jsonData)

import Foundation

// MARK: - RecipeResponse
struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable, Hashable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let gaps: String
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let creditsText: String
    let license: String?
    let sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String
    let image: String
    let imageType, summary: String
    let cuisines, dishTypes, diets, occasions: [String]
    let instructions: String
    let analyzedInstructions: [AnalyzedInstruction]
    let originalID: JSONNull?
    let spoonacularSourceURL: String

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, license, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case image, imageType, summary, cuisines, dishTypes, diets, occasions, instructions, analyzedInstructions
        case originalID = "originalId"
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable, Hashable {
    let name: String
    let steps: [Step]
}

// MARK: - Step
struct Step: Codable, Hashable {
    let number: Int
    let step: String
    let ingredients, equipment: [Ent]
    let length: Length?
}

// MARK: - Ent
struct Ent: Codable, Hashable {
    let id: Int
    let name, localizedName, image: String
    let temperature: Length?
}

// MARK: - Length
struct Length: Codable, Hashable {
    let number: Int
    let unit: Unit
}

enum Unit: String, Codable, Hashable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case minutes = "minutes"
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable, Hashable {
    let id: Int
    let aisle: String?
    let image: String
    let consistency: Consistency
    let name, nameClean, original, originalName: String
    let amount: Double
    let unit: String
    let meta: [String]
    let measures: Measures
}

enum Consistency: String, Codable, Hashable {
    case liquid = "LIQUID"
    case solid = "SOLID"
}

// MARK: - Measures
struct Measures: Codable, Hashable {
    let us, metric: Metric
}

// MARK: - Metric
struct Metric: Codable, Hashable {
    let amount: Double
    let unitShort, unitLong: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
