//
//  ContentView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    let emojiArray: [String] = ["🎄","🎅","🧤","☃️","🤶","🍪","🍷","🔥","🌟","🦌","🔔"]
    
    @State var listSize = 4
    
    
    
    var body: some View {
        VStack {
            cardDetails
            cardAdjusters}
            .padding()}
    
    
    
    var cardDetails: some View {
        ForEach(0..<listSize, id: \.self)
        {index in CardView(content: emojiArray[index])}}


        
        
    var cardAdjusters: some View {
        HStack{
            Button(
                action: {listSize -= 1},
                label: {Image(systemName: "arrowshape.left.circle.fill")})
            Spacer()
            Button(
                action: {listSize += 1},
                label: {Image(systemName: "arrowshape.right.circle.fill")})
            }
            .padding()
            .foregroundColor(.pink)
            .imageScale(.large)}}




struct CardView: View {
    @State var Filled: Bool = true
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if Filled {
                base.fill(.blue)
                base.strokeBorder(lineWidth:3)
                VStack {
                    Text(content)
                        .foregroundColor(Color.yellow)
                }
            }
            else {
                base.fill(.white)
                base.strokeBorder(lineWidth:3)
                VStack {
                    Text(content)
                        .foregroundColor(Color.orange)
                }
            }
        }
        .onTapGesture(perform: {
            Filled = !Filled
    })
    }
}


#Preview {
    ContentView()
}
