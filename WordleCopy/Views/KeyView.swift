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
    var keyType: KeyType
    var action: () -> ()
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(keyType == .letter ? color : .mint)
            if keyType == .delete || keyType == .guess {
                Image(systemName: label)
            } else {
                Text(label)
            }
        }
//        .frame(width: 32, height: 60)
        .formatKey(as: keyType)
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
                .frame(width: 30, height: 60)
        case .delete:
            content
                .frame(width: 60, height: 60)
        case .guess:
            content
                .frame(width: 60, height: 60)
        }
    }
}

enum KeyType: Hashable {
    case letter
    case delete
    case guess
}

#Preview {
    KeyView(label: "A", color: .blue, keyType: .letter) {
        
    }
}
