//
//  ContentView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            NewsTabView()
                .tabItem {
                    Label("Weekly", systemImage: "book.pages")
                }
            NewsTabView()
                .tabItem {
                    Label("Podcasts+", systemImage: "beats.headphones")
                }
            NewsTabView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
            NewsTabView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
        }
        
        
    }
}

#Preview {
    ContentView()
}
