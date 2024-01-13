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
            CardView(Filled: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .font(.title)
        .imageScale(.small)
        .foregroundColor(.blue)
    }
}
    


struct CardView: View {
    var Filled: Bool = false
    
    var body: some View {
        ZStack {
            if Filled {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth:3)
                VStack {
                    Text("❄️")
                    Text("Emoji")
                        .foregroundColor(Color.yellow)
                }
            }
            else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth:3)
                VStack {
                    Text("❄️")
                    Text("Emoji")
                        .foregroundColor(Color.pink)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
