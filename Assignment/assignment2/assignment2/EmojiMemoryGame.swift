//
//  EmojiMemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"]
    
    // ****매개변수로서의 함수 정리 필요..!*****
    static func createMemoryGame() -> MemoryGame<String> {
        let shuffledEmojis = emojis.shuffled()
        return MemoryGame<String>(numberOfPairOfCard: 10) { pairIndex in
            pairIndex < shuffledEmojis.count ? shuffledEmojis[pairIndex] : nil
        }
    }
    // ~ 여기까지가 model 생성
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var score: Int {
        return model.score
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
