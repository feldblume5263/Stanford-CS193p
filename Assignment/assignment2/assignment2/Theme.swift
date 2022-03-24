//
//  Theme.swift
//  Assignment2
//
//  Created by Noah Park on 2022/03/24.
//

import Foundation

struct Theme<CardContent> where CardContent: Equatable {
    var name: String
    var emojis: [CardContent]
    var color: String
    var numberOfPairOfCard: Int
}

