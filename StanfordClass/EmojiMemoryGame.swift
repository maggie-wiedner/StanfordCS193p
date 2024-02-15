//
//  EmojiMemoryGame.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/15/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojiArray = ["🎄","🎅","🧤","☃️","🤶","🍪","🍷","🔥","🌟","🦌","🔔"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojiArray.indices.contains(pairIndex){
                return emojiArray[pairIndex]}
            else {
                return "!?"}}}
        
    @Published private var model = EmojiMemoryGame.createMemoryGame()
        
    // The View will not be able to view the private variables
    // Static makes the variable act like a global variable, without creating generic global names
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        return .orange
    }
    
    var score: Int {
        return model.score
    }
        
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
        // MARK: - Intents
    
        func shuffle() {
            model.shuffle()
            objectWillChange.send()
        }

        
        
}
