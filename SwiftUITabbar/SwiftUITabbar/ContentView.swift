//
//  ContentView.swift
//  SwiftUITabbar
//
//  Created by Mohit Rajpoot on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionTab:Int = 2
    var body: some View {
        TabView(selection: $selectionTab){
            HomeTabbar()
                .tabItem {
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Text("Search")
                }
            PlayView()
                .tabItem {
                    Text("Play")
                }
            NotesView()
                .tabItem {
                    Text("Notes")
                }
            MessageView()
                .tabItem {
                    Text("Message")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
