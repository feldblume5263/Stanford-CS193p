//
//  ContentView.swift
//  Memorize
//
//  Created by Junhong Park on 2022/02/13.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
                .foregroundColor(.blue)
            Text("Hello World")
                .padding(.all)
        })
        .padding(5)
        .ignoresSafeArea()
        
    }
}
