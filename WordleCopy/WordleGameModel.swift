//
//  WordleGameModel.swift
//  WordleCopy
//
//  Created by Johnny O on 2/7/24.
//

import Observation
import SwiftUI

//struct LetterCard: Identifiable {
//    var id = UUID()
//    var value: String = " "
//    var isFlipped: Bool = false
//    var result: GuessResult? = nil
//}

//struct Guess: Identifiable {
//    var id = UUID()
//    var letterCards = [LetterCard]()
//    
//    init(wordLength: Int) {
//        for _ in 0..<wordLength {
//            letterCards.append(LetterCard())
//        }
//    }
//}


@Observable
class WordleGameModel {
    
//    let wordleLength: Int!
//    let numGuesses: Int!
    
//    var wordle: String
//    var gameGrid = [[LetterCard]]()
    var currentGuessIndex: Int? = 0
    var placingLetterIndex: Int? = 0

//    init(wordle: String, numGuesses: Int) {
//        self.wordleLength = wordle.count
//        self.numGuesses = numGuesses
//        self.wordle = wordle
//        
//        for guess in 0..<numGuesses {
//            for index in 0..<wordleLength {
//                gameGrid[guess][index] = LetterCard()
//            }
//        }
//    }
//    
//    func flipLetterAt(guess: Int, index: Int) {
//        gameGrid[guess][index].isFlipped.toggle()
//        
//    }
//    
//    func getLetterCardFor(guess: Int, index: Int) -> LetterCard {
//        return gameGrid[guess][index]
//    }
//    
//    func performGuess() {
//        
//        guard placingLetterIndex == nil else {
//            return
//        }
//        
//        guard let currentGuess = currentGuessIndex else {
//            return
//        }
//        
//        for i in 0..<wordleLength {
//            flipLetterAt(guess: currentGuess, index: i)
//        }
//        
//        let nextGuess = currentGuess + 1
//        currentGuessIndex = nextGuess == numGuesses ? nil : nextGuess
//        placingLetterIndex = 0
//    }
//    
//    func placeNextLetter(_ letter: String) {
//        
//        guard let guess = currentGuessIndex else {
//            return
//        }
//        
//        guard let index = placingLetterIndex else {
//            return
//        }
//        
//        gameGrid[guess][index].value = letter
//        progressPlacementIndex()
//    }
//    
//    private func progressPlacementIndex() {
//        
//        guard let currentIndex = self.placingLetterIndex else {
//            return
//        }
//        
//        let nextIndex = currentIndex + 1
//        self.placingLetterIndex = nextIndex == wordleLength ? nil : nextIndex
//    }
    
    
}
