//
//  CardView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 2/7/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
            Text(card.content)
                .font(.system(size: Constants.FontSize.largest))
                .minimumScaleFactor(Constants.FontSize.scaleFactor)
                .multilineTextAlignment(.center)
                .aspectRatio(1, contentMode: .fit)
                .padding(Constants.Pie.inset)
                .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                .animation(.linear (duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0 )
    }
    
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 7
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}



#Preview {
    CardView(MemoryGame<String>.Card(content: "x", id: "test1"))
}
