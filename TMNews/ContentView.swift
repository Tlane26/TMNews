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
        }
    }
}

#Preview {
    ContentView()
}
