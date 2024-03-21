//
//  WordleGame.swift
//  WordleCopy
//
//  Created by Johnny O on 2/27/24.
//

import Foundation

class WordleGame {
    
    var wordle: String
    var wordleLength: Int {
        return wordle.count
    }
    var validGuesses: [String]!
    
    init(_ wordle: String? = nil) {
        self.wordle = wordle ?? WordleGame.getRandomWordle()
        self.validGuesses = loadFile("valid-guesses.txt") + loadFile("valid-wordles.txt")
        print("WORDLE \(self.wordle)")
    }
    
    func isValidWord(_ word: String) -> Bool {
        print("\(word) check")
        
        return validGuesses.contains(word.uppercased())
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
    
    static func getRandomWordle() -> String {
        
        var result: [String] = []
        do {
            if let bundlePath = Bundle.main.path(forResource: "valid-wordles.txt", ofType: nil) {
                let stringContent = try String(contentsOfFile: bundlePath).uppercased()
                result = stringContent.split(whereSeparator: \.isNewline).map { s in
                    let newStr = String(s).replacingOccurrences(of: "\"", with: "")
                    return newStr
                }
            }
        } catch {
            fatalError("Error reading file: \(error)")
        }

        return result.randomElement()!
    }
    
    private func loadFile(_ filename: String) -> [String] {
        var result: [String] = []
        do {
            if let bundlePath = Bundle.main.path(forResource: filename, ofType: nil) {
                let stringContent = try String(contentsOfFile: bundlePath).uppercased()
                result = stringContent.split(whereSeparator: \.isNewline).map { s in
                    let newStr = String(s).replacingOccurrences(of: "\"", with: "")
                    return newStr
                }
            }
        } catch {
            fatalError("Error reading file: \(error)")
        }
        
        return result
    }
}
