//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Junhong Park on 2022/02/13.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
     
    var body: some Scene {
        WindowGroup {
            EmojiMemroyView(game: game)
        }
    }
}
