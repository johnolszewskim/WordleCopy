//
//  KeyboardView.swift
//  WordleCopy
//
//  Created by Johnny O on 2/28/24.
//

import SwiftUI

struct KeyboardView: View {
    
    let topRow = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    let middleRow = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    let bottomRow = ["Z", "X", "C", "V", "B", "N", "M"]
    
    @Binding var gameController: WorldGameViewController
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                
                ForEach(topRow, id: \.self) { letter in
                    KeyView(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
                        let _ = gameController.placeNextLetter(letter) // will use for haptic feedback
                    }
                    .disabled(gameController.gameIsOver)
                }
            }
            
            HStack(spacing: 5){
                
                ForEach(middleRow, id: \.self) { letter in
                    KeyView(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
                        let _ = gameController.placeNextLetter(letter) // will use for haptic feedback
                    }
                    .disabled(gameController.gameIsOver)
                }
            }
            
            HStack(spacing: 5){
                
                Button {
                    let _ = gameController.removeLastLetter()
                } label: {
                    Image(systemName: "delete.left.fill")
                }
                
                ForEach(bottomRow, id: \.self) { letter in
                    KeyView(letter: letter, color: parseColor(gameController.guessedLetters[letter] ?? .NOT_GUESSED)) {
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
    
    #warning("duplicate parseColor() methods")
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

//#Preview {
//    KeyboardView(gameController: WorldGameViewController())
//}
