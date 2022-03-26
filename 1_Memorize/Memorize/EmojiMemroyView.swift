//
//  EmojiMemroyView.swift
//  Memorize
//
//  Created by Junhong Park on 2022/02/13.
//

import SwiftUI

struct EmojiMemroyView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(game.cards ) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
        }
        .foregroundColor(.green)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card 
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder (lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemroyView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemroyView(game: game)
            .preferredColorScheme(.light)
    }
}
