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
            Text("Score : 0")
                .font(.largeTitle)
                .padding()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80.0))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(content: card.content)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            Text("New Game").font(.largeTitle).padding()
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ThemeButton: View {
    @Binding var emojis: [String]
    var themeIcon: String
    var themeName: String
    var newTheme: [String]
    
    var body: some View {
        VStack {
            Text(themeIcon)
                .font(.largeTitle)
            Text(themeName)
                .font(.caption)
        }
        .onTapGesture {
            emojis = newTheme.shuffled()
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    let cardShape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        ZStack {
            if isFaceUp == true {
                cardShape
                    .fill().foregroundColor(.white)
                cardShape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                cardShape
                    .fill()
            }
        }
        .foregroundColor(.blue)
        .onTapGesture {
            isFaceUp.toggle()
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


