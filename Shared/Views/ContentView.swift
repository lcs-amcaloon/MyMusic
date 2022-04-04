//
//  ContentView.swift
//  Shared
//
//  Created on 2022-03-25.
//

import SwiftUI

struct ContentView: View {
    
    // Stores all tasks that are being tracked
    @ObservedObject var store: AlbumStore
    
    // Controls whether the add task is showing
    @State private var showingAddAlbum = false
    
    // Whether to show comleted tasks or not
    @State var showingCompletedAlbums = true
    
    @State var listShouldUpdate = true
    
    @State private var selectedTab = ""
    
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            NavigationView {
                ListenedAlbums(store: store.self)
            }
            .tabItem {
                Label("Have Listened to", systemImage: "music.note.list")
            }
            NavigationView {
                WillListenAlbums(store: store.self)
            }
            .tabItem {
                Label("Will Listent To", systemImage: "text.insert")
            }
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}
