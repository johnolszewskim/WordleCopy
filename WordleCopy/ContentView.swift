//
//  ContentView.swift
//  WordleCopy
//
//  Created by Johnny O on 1/28/24.
//

import SwiftUI

struct ContentView: View {
    
    let topRow = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    let middleRow = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    let bottomRow = ["Z", "X", "C", "V", "B", "N", "M"]
    
    @State private var gameController = WorldGameViewController()

    var body: some View {
        
        VStack {
            VStack(spacing: 5) {
                ForEach(0..<gameController.numberOfGuesses, id: \.self) { guessIndex in
                    HStack(spacing: 5) {
                        ForEach(0..<gameController.wordleLength, id: \.self) { letterIndex in
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .aspectRatio(1, contentMode: .fit)
                                    .foregroundColor(parseColor(gameController.resultGrid[guessIndex][letterIndex]))
                                    
                                Text(gameController.letterGrid[guessIndex][letterIndex])
                            }
                        }
                    }
                }
            }
            .padding()
            
            #warning("refactor keyboard")
            VStack {
                HStack(spacing: 5) {
                    
                    ForEach(topRow, id: \.self) { letter in
                        Key(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
                            let _ = gameController.placeNextLetter(letter) // will use for haptic feedback
                        }
                        .disabled(gameController.gameIsOver)
                    }
                }
                
                HStack(spacing: 5){
                    
                    ForEach(middleRow, id: \.self) { letter in
                        Key(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
                            let _ = gameController.placeNextLetter(letter) // will use for haptic feedback
                        }
                        .disabled(gameController.gameIsOver)
                    }
                }
                
                HStack(spacing: 5){
                    
                    ForEach(bottomRow, id: \.self) { letter in
                        Key(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
                            let _ = gameController.placeNextLetter(letter) // will use for haptic feedback
                        }
                        .disabled(gameController.gameIsOver)
                    }
                    
                    Button("Guess")  {
                        gameController.guess()
                    }
                    .disabled(!gameController.guessIsEnabled)
                }
            }
            .padding()
        }
    }
    
    private func parseColor(_ result: GuessResult) -> Color {
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

#Preview {
    ContentView()
}

struct Key: View {
    var letter: String
    var color: Color
    var action: () -> ()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(color)
            Text(letter)
        }
//        .frame(width: 35, height: 65)
        .aspectRatio(3/5, contentMode: .fit)
        .onTapGesture {
            action()
        }
    }
}


