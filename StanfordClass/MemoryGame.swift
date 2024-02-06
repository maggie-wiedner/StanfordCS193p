//
//  MemorizeGame.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/15/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var cont: CardContent
        
        
    }
}
