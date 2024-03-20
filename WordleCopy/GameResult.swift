//
//  GameResult.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI
import SwiftData

@Model
class GameResult {
    
    var wordle: String
    
    init(wordle: String) {
        self.wordle = wordle
    }
}
