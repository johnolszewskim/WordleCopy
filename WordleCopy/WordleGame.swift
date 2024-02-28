//
//  WordleGame.swift
//  WordleCopy
//
//  Created by Johnny O on 2/27/24.
//

import Foundation

class WordleGame {
    
    var wordle: String = "SWIFT"
    var wordleLength: Int {
        return wordle.count
    }
    
    func guess(_ guess: [String]) -> [GuessResult] {
        
        var result: [GuessResult] = []
        
        for i in 0..<wordle.count {
            
            let index = wordle.index(wordle.startIndex, offsetBy: i)
            let char = String(wordle[index])
            
            if char == guess[i] {
                result.append(GuessResult.CORRECT)
                continue
            }
            
            // if the guess[i] is not exactly the letter being examined, if it is contained
            // in the wordle it must be at a different index, or else it't not in the wordle
            // at all
            result.append(wordle.contains(guess[i]) ? GuessResult.WRONG_INDEX : GuessResult.WRONG)
        }
        
    
        return result
    }
}
