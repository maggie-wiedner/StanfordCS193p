//
//  ContentView.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView()
            CardView()
            CardView(Filled: false)
            CardView()
        }
        .padding()
        .font(.title)
        .imageScale(.small)
        .foregroundColor(.blue)
    }
}
    


struct CardView: View {
    @State var Filled: Bool = true

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if Filled {
                base.fill(.blue)
                base.strokeBorder(lineWidth:3)
                VStack {
                    Text("❄️")
                    Text("Emoji")
                        .foregroundColor(Color.yellow)
                }
            }
            else {
                base.fill(.white)
                base.strokeBorder(lineWidth:3)
                VStack {
                    Text("❄️")
                    Text("Emoji")
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
