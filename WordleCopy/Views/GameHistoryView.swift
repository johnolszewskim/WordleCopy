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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(result.didWin ? "Win!" : "Lost. Wordle: \(result.wordle)")
            }
            HStack(spacing: 5) {
                ForEach(0..<result.wordle.count, id: \.self) { letterIndex in
                    GridSquareView(letter: result.letterGrid[5][letterIndex], color: colorParser(result.resultGrid[5][letterIndex]))
                }
            }
        }
    }
}

//#Preview {
//    GameHistoryView()
//}
