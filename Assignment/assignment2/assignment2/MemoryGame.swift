//
//  MemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var score: Int = 0
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    // 전형적인 예시
    // 중요한건 pairIndex 변수가 어떻게 쓰이느냐...!!
    init(numberOfPairOfCard: Int, createCardContent: (Int) -> CardContent?) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCard {
            if let content: CardContent = createCardContent(pairIndex) {
                cards.append(Card(id: pairIndex * 2, content: content))
                cards.append(Card(id: pairIndex * 2 + 1, content: content))
            }
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card) {
        let chosenIndex = cards.firstIndex(where: { $0.id == card.id })
        
        if let chosenIndex = chosenIndex, !cards[chosenIndex].isFaceUp {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score = score + 2
                } else {
                    score = cards[chosenIndex].isFlipped ? score - 1 : score
                    score = cards[potentialMatchIndex].isFlipped ? score - 1 : score
                    cards[potentialMatchIndex].isFlipped = true
                    cards[chosenIndex].isFlipped = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var isFlipped: Bool = false
    }
    //    // 이런식으로 Model을 전부??
    //    func testFunction<CardContent>(_ input: CardContent) {
    //        print(input)
    //    }
}
