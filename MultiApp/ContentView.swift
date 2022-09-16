//
//  ContentView.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Int = 0
    @ObservedObject var playingViewModal = GuessNumber()

    var body: some View {
        TabView(selection: $tabSelection) {
#if os(watchOS)
            WatchOSContentView()
                .environmentObject(playingViewModal)
                .tag(0)
                .tabItem {
                    Label("Play", systemImage: "keyboard")
                }
#else
            PlayView()
                .environmentObject(playingViewModal)
                .tag(0)
                .tabItem {
                    Label("Play", systemImage: "keyboard")
                }
#endif
            SettingsView()
                .tag(1)
                .tabItem {
                    Label("Settings", systemImage: "wrench.fill")
                }
            LeaderboardView()
                .environmentObject(playingViewModal)
                .tag(2)
                .tabItem {
                    Label("Leaders", systemImage: "list.number")
                }
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
