//
//  StanfordClassApp.swift
//  StanfordClass
//
//  Created by Maggie Wiedner on 1/8/24.
//

import SwiftUI

@main
struct StanfordClassApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
