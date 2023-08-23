//
//  OpenAIModel.swift
//  InternApp
//
//  Created by mert Kanak on 17.08.2023.
//

import Foundation

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
}

struct OpenAICompletionsResponse: Decodable {
    let id: String
    let choices: [OpenAICompletionsChoice]
}

struct OpenAICompletionsChoice: Decodable {
    let text: String
    
}
