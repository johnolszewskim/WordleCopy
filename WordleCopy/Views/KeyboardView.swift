//
//  KeyboardView.swift
//  WordleCopy
//
//  Created by Johnny O on 2/28/24.
//

import SwiftUI

struct KeyboardView: View {
    
    let keyboard: [[(String, KeyType)]] = [[("Q", .letter), ("W", .letter), ("E", .letter), ("R", .letter), ("T", .letter), ("Y", .letter), ("U", .letter), ("I", .letter), ("O", .letter), ("P", .letter)],
                                           [("A", .letter), ("S", .letter), ("D", .letter), ("F", .letter), ("G", .letter), ("H", .letter), ("J", .letter), ("K", .letter), ("L", .letter)],
                                           [("delete.left.fill", .delete),("Z", .letter), ("X", .letter), ("C", .letter), ("V", .letter), ("B", .letter), ("N", .letter), ("M", .letter), ("return", .guess)]]
    
    @Binding var gameController: WorldGameViewController
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<3) { i in
                HStack(spacing: 5) {
                    ForEach(keyboard[i], id: \.self.0) { key in
                        KeyView(label: key.0, color: gameController.parseColor(gameController.letterResults[key.0] ?? .NOT_GUESSED), keyType: key.1) {
                            if key.1 == .letter {
                                let _ = gameController.placeNextLetter(key.0) // will use for haptic feedback
                            } else if key.1 == .delete {
                                let _ = gameController.removeLastLetter()
                            } else {
                                gameController.guess()
                            }
                        }
                        .disabled(gameController.gameIsOver)
                    }
                }
            }
        }
//        .padding()
    }
}
