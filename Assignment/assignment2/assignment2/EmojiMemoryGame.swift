//
//  EmojiMemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"]
    
    // 매개변수로서의 함수 정리 필요..!
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairOfCard: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    // ~ 여기까지가 model 생성
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
