//
//  ContentView.swift
//  assignment1
//
//  Created by Noah Park on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    let vehicles = ["🚂", "🚜", "🚗", "🚄", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🚚", "🏍"]
    let fruits = ["🍎", "🍋", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥝"]
    let flags =  ["🇰🇷", "🇩🇪", "🇺🇦", "🇺🇸", "🇫🇷", "🇪🇸", "🇯🇵", "🇨🇦", "🇰🇭", "🇮🇶", "🇬🇧", "🇮🇩"]
    
    @State var emogis = ["🚂", "🚜", "🚗", "🚄", "🚌", "🚑", "🚔", "🛵", "🚕", "🚒", "🚚",  "🏍"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .padding()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80.0))]) {
                    ForEach(emogis, id: \.self) { emogi in
                        CardView(content: emogi)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                Spacer()
                ThemeButton(themeIcon: "🚗", themeName: "Vehicles", themeEmojis: $emogis, newTheme: vehicles)
                Spacer()
                ThemeButton(themeIcon: "🍎", themeName: "Fruits", themeEmojis: $emogis, newTheme: fruits)
                Spacer()
                ThemeButton(themeIcon: "🇰🇷", themeName: "Flags", themeEmojis: $emogis, newTheme: flags)
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ThemeButton: View {
    var themeIcon: String
    var themeName: String
    @Binding var themeEmojis: [String]
    var newTheme: [String]
    
    var body: some View {
        VStack {
            Text(themeIcon)
                .font(.largeTitle)
            Text(themeName)
                .font(.caption)
        }
        .onTapGesture {
            themeEmojis = newTheme.shuffled()
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
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
