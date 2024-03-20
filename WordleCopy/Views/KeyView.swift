//
//  KeyView.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI

struct KeyView: View {
    
    var letter: String
    var color: Color
    var action: () -> ()
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(color)
            Text(letter)
        }
        //        .frame(width: 35, height: 65)
        .aspectRatio(3/5, contentMode: .fit)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    KeyView(letter: "A", color: .blue) {
        
    }
}
