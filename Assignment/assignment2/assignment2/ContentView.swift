//
//  ContentView.swift
//  assignment2
//
//  Created by Noah Park on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Score : \(viewModel.score)")
                .font(.largeTitle)
                .padding()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80.0))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                            .foregroundColor(Color(wordName: viewModel.theme.color) ?? .black)
                            .opacity(card.isMatched ? 0.0 : 1)
                    }
                }
            }
            Spacer()
            Button {
                viewModel.setNewGame()
            } label: {
                Text("New Game").font(.largeTitle).padding()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    private let cardShape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        ZStack {
            if card.isFaceUp == true {
                cardShape
                    .fill().foregroundColor(.white)
                cardShape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                cardShape
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewInterfaceOrientation(.portrait)
    }
}

extension Color {
    
    init?(wordName: String) {
        switch wordName {
        case "red":         self = .red
        case "green":       self = .green
        case "blue":        self = .blue
        case "orange":      self = .orange
        case "yellow":      self = .yellow
        case "purple":      self = .purple
        default:            return nil
        }
    }
}


