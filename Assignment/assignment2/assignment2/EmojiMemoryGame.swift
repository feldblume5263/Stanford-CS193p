//
//  EmojiMemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let defaultTheme = Theme(name: "vehicles",
                                    emojis: ["๐", "๐", "๐", "๐", "๐ฒ", "๐", "๐", "๐", "๐ต", "๐", "๐", "๐ด", "๐", "๐", "๐"],
                                    color: "yellow",
                                    numberOfPairOfCard: 20)
    static var themes: [Theme<String>] = [defaultTheme,
                                          Theme(name: "fruits",
                                                emojis: ["๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "๐", "๐", "๐ฅญ", "๐", "๐ฅ"],
                                                color: "blue",
                                                numberOfPairOfCard: 20),
                                          Theme(name: "Flags",
                                                emojis: ["๐ฐ๐ท", "๐ฉ๐ช", "๐บ๐ฆ", "๐บ๐ธ", "๐ซ๐ท", "๐ช๐ธ", "๐ฐ๐ท", "๐จ๐ฆ", "๐ฐ๐ญ", "๐ฎ๐ถ", "๐ฌ๐ง", "๐ฎ๐ฉ"],
                                                color: "red",
                                                numberOfPairOfCard: 20)]
    // ์๋ 6๊ฐ๋ฅผ ํด์ผ ํจ (์ด๋ชจ์ง ์ถ๊ฐ ๊ท์ฐฎ์...)
    
    // ****๋งค๊ฐ๋ณ์๋ก์์ ํจ์ ์ ๋ฆฌ ํ์..!*****
    static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairOfCard: 10) { pairIndex in
            pairIndex < shuffledEmojis.count ? shuffledEmojis[pairIndex] : nil
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes.first ??
                                                                        Theme(name: "vehicles",
                                                                              emojis: ["๐", "๐", "๐", "๐", "๐ฒ", "๐", "๐", "๐", "๐ต", "๐", "๐", "๐ด", "๐", "๐", "๐"],
                                                                              color: "yellow",
                                                                              numberOfPairOfCard: 20))
    // ~ ์ฌ๊ธฐ๊น์ง๊ฐ game model ์์ฑ
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
