//
//  WordAPIModel.swift
//  InternApp
//
//  Created by mert Kanak on 23.08.2023.
//
import Foundation

struct WordDefinition: Codable {
    let word: String
    let results: [Results]
}

struct Results: Codable {
    let definition: String
}


