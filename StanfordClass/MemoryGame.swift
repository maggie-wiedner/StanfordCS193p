//
//  MemorizeGame.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/15/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))}}
    
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)}}}
    
    
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"}}
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex( where: { $0.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if  cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true}
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex}
                cards[chosenIndex].isFaceUp = true}}}
    
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id { return index }}
        return nil}
    
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)}
    
    
}


extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}



