//
//  ContentView.swift
//  Memorize
//
//  Created by Junhong Park on 2022/02/13.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        ["🚂", "🚜", "🚗", "🚄", "🚲", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🛴", "🚚", "🏎", "🏍"],
        ["🍎", "🍋", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥝", "🍅"],
        ["🇰🇷", "🇩🇪", "🇺🇦", "🇺🇸", "🇫🇷", "🇪🇸", "🇯🇵", "🇨🇦", "🇰🇭", "🇮🇶", "🇬🇧", "🇮🇩", "🇨🇮"]
    ]
    @State var emojiIndex = 0
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[emojiIndex].shuffled()[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.green)
            Spacer()
            HStack {
                remove
                Spacer()
                themeA
                Spacer()
                themeB
                Spacer()
                themeC
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.all)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount >= 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis[emojiIndex].count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
    
    var themeA: some View {
        Button {
            emojiIndex = 0
            if emojiCount > emojis[emojiIndex].count {
                emojiCount = emojis[emojiIndex].count
            }
        } label: {
            VStack {
                Text("🚗")
                    .font(.title)
                Text("Vehicles")
                    .font(.caption)
            }
        }
    }
    
    var themeB: some View {
        Button {
            emojiIndex = 1
            if emojiCount > emojis[emojiIndex].count {
                emojiCount = emojis[emojiIndex].count
            }
        } label: {
            VStack {
                Text("🍎")
                    .font(.title)
                Text("Fruits")
                    .font(.caption)
            }
        }
    }
    
    var themeC: some View {
        Button {
            emojiIndex = 2
            if emojiCount > emojis[emojiIndex].count {
                emojiCount = emojis[emojiIndex].count
            }
        } label: {
            VStack {
                Text("🇰🇷")
                    .font(.title)
                Text("Flags")
                    .font(.caption)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder (lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
        ContentView()
            .preferredColorScheme(.light)
    }
}
