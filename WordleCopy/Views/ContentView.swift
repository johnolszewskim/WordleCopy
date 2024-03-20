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
            
            Text("Wordle")
                .font(.title.bold())
            
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
            
            if !gameController.gameIsWon {
                KeyboardView(gameController: $gameController)
            }
        }
    }
}

#Preview {
    ContentView()
}


