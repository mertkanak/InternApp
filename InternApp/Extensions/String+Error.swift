//
//  String+Error.swift
//  InternApp
//
//  Created by mert Kanak on 17.08.2023.
//

import Foundation

extension String: CustomNSError {
    
    public var errorUserInfo: [String : Any] {
        [
            NSLocalizedDescriptionKey: self
        ]
    }
}
