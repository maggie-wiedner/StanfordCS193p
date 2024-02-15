//
//  ContentView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio : CGFloat = 2/3

    
    var body: some View {
        VStack{
            ScrollView {
                cards
                .animation(.default, value: viewModel.cards)}
            HStack {
                score
                Spacer()
                deck
                Spacer()
                Button("Shuffle"){
                    withAnimation {
                        viewModel.shuffle()
                    }
                }
            }
            .font(.title)
            .padding()

        }
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
        }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            if isDealt(card) {
                CardView(card)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                    .onTapGesture {
                        choose(card)
                    }
                    .transition(.offset(
                        x: CGFloat.random(in: -1000...1000),
                        y: CGFloat.random(in: -1000...1000)
                    ))
                }
            }
        .foregroundColor(viewModel.color)
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt (_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                CardView(card)
            }
            .foregroundColor(.orange)
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatio)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 2)) {
                for card in viewModel.cards {
                    dealt.insert(card.id)
                }
            }
        }
    }
    
    private let deckWidth: CGFloat = 50
    
    private func choose(_ card: Card) {
        withAnimation (.easeInOut(duration: 3)) {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score -  scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount: 0
    }

    
}



//Old adjusters I'm going to hide for now but not delete
/*
 
   var cardAdjusters: some View {
       HStack{
           Button(
               action: {listSize -= 1},
               label: {Image(systemName: "arrowshape.left.circle.fill")})
           .disabled(listSize <= 1)
           Spacer()
           Button(
               action: {listSize += 1},
               label: {Image(systemName: "arrowshape.right.circle.fill")})
           .disabled(listSize >= emojiArray.count)
       }
       .padding()
       .foregroundColor(.pink)
       .imageScale(.large)}

 */
   

#Preview {
    ContentView(viewModel:EmojiMemoryGame())
}
