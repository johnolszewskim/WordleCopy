//
//  ContentView.swift
//  WordleCopy
//
//  Created by Johnny O on 1/28/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var savedGames: [GameResult]
    
    @State private var gameController: WorldGameViewController = WorldGameViewController(savedResultsManager: SavedResultsManager())
    @State private var historySheetIsShowing = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text(!gameController.gameIsOver ? "Wordle" : gameController.gameIsWonMessage)
                    .font(.largeTitle.bold())

                VStack {
                    VStack(spacing: 5) {
                        //Create grid
                        ForEach(0..<gameController.numberOfGuesses, id: \.self) { guessIndex in
                            HStack(spacing: 5) {
                                ForEach(0..<gameController.wordleLength, id: \.self) { letterIndex in
                                    GridSquareView(letter: gameController.letterGrid[guessIndex][letterIndex], color: gameController.parseColor(gameController.resultGrid[guessIndex][letterIndex]))
                                }
                            }
                        }
                    }
                    
                    if gameController.gameIsOver && !gameController.gameIsWon {
                        HStack(spacing: 5) {
                            ForEach(0..<gameController.wordleLength, id: \.self) { letterIndex in
                                let indexAsIndex = gameController.game.wordle.index(gameController.game.wordle.startIndex, offsetBy: letterIndex)
                                GridSquareView(letter: String(gameController.game.wordle[indexAsIndex]), color: gameController.parseColor(.CORRECT))
                            }
                        }
                    }
                }
                .padding()
                
                if !gameController.gameIsOver {
                    KeyboardView(gameController: $gameController)
                } else {
                    HStack {
                        
                        Button("New Game") {
                            withAnimation(.bouncy) {
                                gameController = WorldGameViewController(savedResultsManager: SavedResultsManager(modelContext: modelContext))
                            }
                        }
                        .buttonStyle(.bordered)
                        .clipShape(.capsule)
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        historySheetIsShowing.toggle()
                    }, label: {
                        Image(systemName: "list.bullet")
                    })
                }
            }
            .sheet(isPresented: $historySheetIsShowing, content: {
                NavigationView {
                    List(savedGames, id: \.self) { result in
                        GameHistoryView(result: result, colorParser: gameController.parseColor)
                    }
                    .navigationTitle("History")
                }
            })
            .task {
                gameController.savedResultsManager.modelContext = modelContext
            }
        }
    }
}

#Preview {
    ContentView()
}


