//
//  KeyView.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI

struct KeyView: View {
    
    var label: String
    var color: Color
    var action: () -> ()
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(color)
            Text(label)
        }
        .frame(width: 32, height: 60)
        .onTapGesture {
            action()
        }
    }
    
    
}

struct KeyFormat: ViewModifier {
    
    var keyType: KeyType
    
    func body(content: Content) -> some View {
        
        switch keyType {
        case .letter:
            content
                .frame(width: 35, height: 65)
        case .action:
            content
                .frame(width: 65, height: 65)
                .background(.purple)
        }
    }
}

enum KeyType {
    case letter, action
}

#Preview {
    KeyView(label: "A", color: .blue) {
        
    }
}
