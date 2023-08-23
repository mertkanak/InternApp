//
//  DataManager.swift
//  InternApp
//
//  Created by mert Kanak on 17.08.2023.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var addedWordPairs: [WordPair]?
    
    init(addedWordPairs: [WordPair]? = nil) {
        self.addedWordPairs = addedWordPairs
    }
}
