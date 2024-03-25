//
//  GameHistoryView.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI

struct GameHistoryView: View {
    
    var result: GameResult
    var colorParser: (GuessResult) -> Color
    
    @State var showingFullGame = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(result.didWin ? "Win!" : "Lost. Wordle: \(result.wordle)")
                Spacer()
                Text("\(result.lastGuessIndex+1)/\(result.resultGrid.count)")
            }
            HStack {
                if showingFullGame {

                    VStack {
                        ForEach(0..<result.lastGuessIndex+1, id: \.self) { guessIndex in
                            GridGuessView(letters: result.letterGrid[guessIndex], results: result.resultGrid[guessIndex], colorParser: colorParser)
                        }
                    }
                } else {
                    GridGuessView(letters: result.letterGrid[result.lastGuessIndex], results: result.resultGrid[result.lastGuessIndex], colorParser: colorParser)
                }

                Button {
                    showingFullGame.toggle()
                } label: {
                    showingFullGame ? Image(systemName: "rectangle.compress.vertical") : Image(systemName: "rectangle.expand.vertical")
                }
                

            }
            
        }
    }
}

//#Preview {
//    GameHistoryView()
//}
