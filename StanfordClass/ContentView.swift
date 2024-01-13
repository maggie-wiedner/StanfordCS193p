//
//  ContentView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojiArray: [String] = ["🎄","🎅","🧤","☃️","🤶"]
        VStack {
            ForEach(emojiArray.indices, id: \.self) { index in
                CardView(content: emojiArray[index])
            }
        }
        .padding()
        .font(.title)
        .imageScale(.small)
        .foregroundColor(.blue)
    }
}
    


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
