//
//  GridGuessView.swift
//  WordleCopy
//
//  Created by Johnny O on 3/21/24.
//

import SwiftUI

struct GridGuessView: View {
    
    var letters: [String]
    var results: [GuessResult]
    var colorParser: (GuessResult) -> Color
    
    var body: some View {
        HStack {
            ForEach(0..<letters.count, id: \.self) { letterIndex in
                GridSquareView(letter: letters[letterIndex], color: colorParser(results[letterIndex]))
            }
        }
    }
}
