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
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
            })
        }
        .foregroundColor(.green)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder (lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
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
