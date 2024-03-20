//
//  View-extension.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftUI

extension View {
    func formatKey(as keyType: KeyType) -> some View {
        modifier(KeyFormat(keyType: keyType))
    }
}
