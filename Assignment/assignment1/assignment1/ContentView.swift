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
                themeVehicles
                Spacer()
                themeFruits
                Spacer()
                themeFlags
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var themeVehicles: some View {
        VStack {
            Text("🚗")
                .font(.largeTitle)
            Text("Vehicles")
                .font(.caption)
        }
        .onTapGesture {
            emogis = vehicles.shuffled()
        }
    }
    
    var themeFruits: some View {
        VStack {
            Text("🍎")
                .font(.largeTitle)
            Text("Fruits")
                .font(.caption)
        }
        .onTapGesture {
            emogis = fruits.shuffled()
        }
    }
    
    var themeFlags: some View {
        VStack {
            Text("🇰🇷")
                .font(.largeTitle)
            Text("Flags")
                .font(.caption)
        }
        .onTapGesture {
            emogis = flags.shuffled()
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
