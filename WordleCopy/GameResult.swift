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
    var letterGrid: [[String]]
    var resultGrid: [[GuessResult]]
    var didWin: Bool
    
    init(wordle: String, letterGrid: [[String]], resultGrid: [[GuessResult]], didWin: Bool) {
        self.wordle = wordle
        self.letterGrid = letterGrid
        self.resultGrid = resultGrid
        self.didWin = didWin
    }
}
