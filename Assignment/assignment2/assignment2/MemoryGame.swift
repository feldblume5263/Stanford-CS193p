//
//  MemoryGame.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/23.
//

import Foundation

struct Theme {
    
}

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
 
    // 전형적인 예시
    // 중요한건 pairIndex 변수가 어떻게 쓰이느냐...!!
    init(numberOfPairOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCard {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, Content: content))
            cards.append(Card(id: pairIndex * 2 + 1, Content: content))
        }
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var Content: CardContent
        var isFlipped: Bool = false
    }
//    // 이런식으로 Model을 전부??
//    func testFunction<CardContent>(_ input: CardContent) {
//        print(input)
//    }
}
