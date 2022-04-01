//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Noah Park on 2022/03/13.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card // typealias in viewmodel
    private static let emojis = ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"]
    
    // 이해가 잘  가지 않았던 부분: 왜 함수로 해야할까? 생성자를 그대로 쓰면 안되나??
    // <- 우리가 모델로 보내려는 함수: { pairIndex in emojis[pairIndex]
    // 쪼개서 만들어보면 이해가 빠를듯...
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
