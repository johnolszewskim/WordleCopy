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
            
            Spacer()
            
            Text(!gameController.gameIsOver ? "Wordle" : gameController.gameIsWonMessage)
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack(spacing: 5) {
                //Create grid
                ForEach(0..<gameController.numberOfGuesses, id: \.self) { guessIndex in
                    HStack(spacing: 5) {
                        ForEach(0..<gameController.wordleLength, id: \.self) { letterIndex in
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .aspectRatio(1, contentMode: .fit)
                                    .foregroundColor(gameController.parseColor(gameController.resultGrid[guessIndex][letterIndex]))
                                    
                                Text(gameController.letterGrid[guessIndex][letterIndex])
                            }
                        }
                    }
                }
            }
            .padding()
            
            if !gameController.gameIsOver {
                KeyboardView(gameController: $gameController)
            } else {
                HStack {
                    Button("Share") {
                        
                    }
                    .buttonStyle(.bordered)
                    .clipShape(.capsule)
                    
                    Button("New Game") {
                        withAnimation(.bouncy) {
                            gameController = WorldGameViewController()
                        }
                    }
                    .buttonStyle(.bordered)
                    .clipShape(.capsule)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}


