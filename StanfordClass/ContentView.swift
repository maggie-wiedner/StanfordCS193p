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
        .foregroundColor(viewModel.color)
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
