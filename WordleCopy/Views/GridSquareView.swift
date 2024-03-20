//
//  GridSquareView.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI

struct GridSquareView: View {
    
    var letter: String
    var color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(color)
            
            Text(letter)
                .font(.title2)
        }
    }
}

#Preview {
    GridSquareView(letter: "K", color: Color.red)
}
