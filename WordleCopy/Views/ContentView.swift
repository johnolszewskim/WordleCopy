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
                                        .font(.title2)
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
                List(savedGames, id: \.self) { result in
                    Text(result.wordle)
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


