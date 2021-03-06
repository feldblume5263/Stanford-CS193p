//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Noah Park on 2022/03/13.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card // typealias in viewmodel
    private static let emojis = ["π", "π", "π", "π", "π²", "π", "π", "π", "π΅", "π", "π", "π΄", "π", "π", "π"]
    
    // μ΄ν΄κ° μ  κ°μ§ μμλ λΆλΆ: μ ν¨μλ‘ ν΄μΌν κΉ? μμ±μλ₯Ό κ·Έλλ‘ μ°λ©΄ μλλ??
    // <- μ°λ¦¬κ° λͺ¨λΈλ‘ λ³΄λ΄λ €λ ν¨μ: { pairIndex in emojis[pairIndex]
    // μͺΌκ°μ λ§λ€μ΄λ³΄λ©΄ μ΄ν΄κ° λΉ λ₯Όλ―...
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


class NumMemoryGame: ObservableObject {
    typealias Card = MemoryGame<Int>.Card // typealias in viewmodel
    private static let emojis = [1, 2, 3, 4, 5]
    
    // μ΄ν΄κ° μ  κ°μ§ μμλ λΆλΆ: μ ν¨μλ‘ ν΄μΌν κΉ? μμ±μλ₯Ό κ·Έλλ‘ μ°λ©΄ μλλ??
    // <- μ°λ¦¬κ° λͺ¨λΈλ‘ λ³΄λ΄λ €λ ν¨μ: { pairIndex in emojis[pairIndex]
    // μͺΌκ°μ λ§λ€μ΄λ³΄λ©΄ μ΄ν΄κ° λΉ λ₯Όλ―...
    static func createMemoryGame() -> MemoryGame<Int> {
        return MemoryGame<Int>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<Int> = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<Int>.Card) {
        model.choose(card)
    }
}
