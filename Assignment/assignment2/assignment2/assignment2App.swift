//
//  assignment2App.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/09.
//

import SwiftUI

@main
struct assignment1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
