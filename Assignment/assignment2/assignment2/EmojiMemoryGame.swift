//
//  EmojiMemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let defaultTheme = Theme(name: "vehicles",
                                    emojis: ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"],
                                    color: "yellow",
                                    numberOfPairOfCard: 20)
    static var themes: [Theme<String>] = [defaultTheme,
                                          Theme(name: "fruits",
                                                emojis: ["🍎", "🍋", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥝"],
                                                color: "blue",
                                                numberOfPairOfCard: 20),
                                          Theme(name: "Flags",
                                                emojis: ["🇰🇷", "🇩🇪", "🇺🇦", "🇺🇸", "🇫🇷", "🇪🇸", "🇰🇷", "🇨🇦", "🇰🇭", "🇮🇶", "🇬🇧", "🇮🇩"],
                                                color: "red",
                                                numberOfPairOfCard: 20)]
    // 원래 6개를 해야 함 (이모지 추가 귀찮아...)
    
    // ****매개변수로서의 함수 정리 필요..!*****
    static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairOfCard: 10) { pairIndex in
            pairIndex < shuffledEmojis.count ? shuffledEmojis[pairIndex] : nil
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes.first ??
                                                                        Theme(name: "vehicles",
                                                                              emojis: ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"],
                                                                              color: "yellow",
                                                                              numberOfPairOfCard: 20))
    // ~ 여기까지가 game model 생성
    var theme: Theme<String> = EmojiMemoryGame.themes.randomElement() ?? EmojiMemoryGame.defaultTheme
    
    var score: Int {
        return model.score
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func setNewGame() {
        theme = EmojiMemoryGame.themes.randomElement() ?? theme
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
