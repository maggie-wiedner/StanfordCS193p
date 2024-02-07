//
//  ContentView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio : CGFloat = 2/3

    
    var body: some View {
        VStack{
            ScrollView {
                cards
                .animation(.default, value: viewModel.cards)}
            Button("Shuffle"){
                viewModel.shuffle()}
            .padding()
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
            }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card}
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0 )
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
