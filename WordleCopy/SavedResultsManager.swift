//
//  SavedResultsManager.swift
//  WordleCopy
//
//  Created by Johnny O on 3/20/24.
//

import SwiftData
import SwiftUI

struct SavedResultsManager {
    var modelContext: ModelContext? = nil
    
    func save(_ game: GameResult) {
        print("Saving game \(game.wordle)")
        modelContext!.insert(game)
    }
    
}
