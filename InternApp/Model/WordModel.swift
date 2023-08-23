import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let word: String
    let results: [Result]
    let syllables: Syllables
    let pronunciation: Pronunciation
    let frequency: Double
}

// MARK: - Pronunciation
struct Pronunciation: Codable {
    let all: String
}

// MARK: - Result
struct Result: Codable {
    let definition, partOfSpeech: String
    let synonyms, typeOf: [String]
    let hasTypes, derivation, examples: [String]?
}

// MARK: - Syllables
struct Syllables: Codable {
    let count: Int
    let list: [String]
}
