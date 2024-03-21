//
//  WordleGameViewController.swift
//  WordleCopy
//
//  Created by Johnny O on 2/27/24.
//

import SwiftData
import SwiftUI
import UIKit

@Observable
class WorldGameViewController {
    
    var savedResultsManager: SavedResultsManager!
    
    var game = WordleGame()
    var letterGrid: [[String]] = [["","","","",""],
                                  ["","","","",""],
                                  ["","","","",""],
                                  ["","","","",""],
                                  ["","","","",""],
                                  ["","","","",""]]
    var resultGrid: [[GuessResult]] = [[GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED],
                                  [GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED],
                                  [GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED],
                                  [GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED],
                                  [GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED],
                                  [GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED, GuessResult.NOT_GUESSED]]
    var guessedLetters: [String:GuessResult] = [
        "A": GuessResult.NOT_GUESSED,
        "B" : GuessResult.NOT_GUESSED,
        "C" : GuessResult.NOT_GUESSED,
        "D" : GuessResult.NOT_GUESSED,
        "E" : GuessResult.NOT_GUESSED,
        "F" : GuessResult.NOT_GUESSED,
        "G" : GuessResult.NOT_GUESSED,
        "H" : GuessResult.NOT_GUESSED,
        "I" : GuessResult.NOT_GUESSED,
        "J" : GuessResult.NOT_GUESSED,
        "K" : GuessResult.NOT_GUESSED,
        "L" : GuessResult.NOT_GUESSED,
        "M" : GuessResult.NOT_GUESSED,
        "N" : GuessResult.NOT_GUESSED,
        "O" : GuessResult.NOT_GUESSED,
        "P" : GuessResult.NOT_GUESSED,
        "Q" : GuessResult.NOT_GUESSED,
        "R" : GuessResult.NOT_GUESSED,
        "S" : GuessResult.NOT_GUESSED,
        "T" : GuessResult.NOT_GUESSED,
        "U" : GuessResult.NOT_GUESSED,
        "V" : GuessResult.NOT_GUESSED,
        "W" : GuessResult.NOT_GUESSED,
        "X" : GuessResult.NOT_GUESSED,
        "Y" : GuessResult.NOT_GUESSED,
        "Z": GuessResult.NOT_GUESSED]
//    = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { letter in
//        [letter: GuessResult.NOT_GUESSED]
//    }
    var wordleLength = 5
    var numberOfGuesses = 6
    var currentGuessIndex = 5 // 0 testing
    var currentLetterIndex = 0
    var guessIsEnabled: Bool {
        if currentLetterIndex == wordleLength {
            return true
        }
        
        return false
    }
    
    // if the player has:
    // - used all their guesses or
    // - won the game
    var gameIsOver: Bool {
        if currentGuessIndex == numberOfGuesses {
            return true
        }
        if gameIsWon == true {
            return true
        }
        return false
    }
    var gameIsWon: Bool = false
    var gameIsWonMessage: String {
        return gameIsWon ? "You win!" : "Nice try!"
    }
    
    init(savedResultsManager: SavedResultsManager) {
        self.savedResultsManager = savedResultsManager
    }
    
    func placeNextLetter(_ letter: String) -> Bool {
        
        // letters should be enabled if game is over in the first place
        if gameIsOver {
            return false
        }
        
        // all letters have been placed for current guess
        if currentLetterIndex == wordleLength {
            return false
        }
        
        if letter.count != 1 {
            return false
        }
        
        letterGrid[currentGuessIndex][currentLetterIndex] = letter
        currentLetterIndex += 1
        
        return true
    }
    
    func removeLastLetter() -> Bool {
        if currentLetterIndex == 0 {
            return false
        }
        
        currentLetterIndex -= 1
        letterGrid[currentGuessIndex][currentLetterIndex] = ""
        
        return true
    }
    
    func guess() {
        
        if !game.isValidWord(letterGrid[currentGuessIndex].joined()) {
            return
        }
        
        let result = game.guess(letterGrid[currentGuessIndex])
        var win = true
        
        for i in 0..<result.count {
            // add result for letter to grid
            withAnimation(.easeInOut(duration: 0.5).delay(0.5*Double(i))) {
                resultGrid[currentGuessIndex][i] = result[i]
            }
            
            // assign appropriate results to guessed letters
            let guessedLetter = letterGrid[currentGuessIndex][i]
            guessedLetters[guessedLetter]! = result[i]
                           
            // if any letters aren't correct the world is not correct
            if result[i] != GuessResult.CORRECT {
                win = false
            }
        }
        
        withAnimation(.bouncy) {
            gameIsWon = win
            currentGuessIndex += 1
        }
        currentLetterIndex = 0
        
        if gameIsOver {
            savedResultsManager.save(GameResult(wordle: game.wordle, letterGrid: letterGrid, resultGrid: resultGrid, didWin: gameIsWon))
        }
    }
    
    func parseColor(_ result: GuessResult) -> Color {
        switch result {
        case .NOT_GUESSED:
            return .gray
        case .CORRECT:
            return .green
        case .WRONG:
            return .red
        case .WRONG_INDEX:
            return .yellow
        }
    }
}
