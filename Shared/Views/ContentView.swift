//
//  ContentView.swift
//  Shared
//
//  Created by Angus McAloon on 2022-03-25.
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
            
            ListenedAlbums(store: store.self)
                .onTapGesture {
                    selectedTab = "Listened"
                }
                .tabItem {
                    Label("Have Listened to", systemImage: "music.note.list")
                }
            
            WillListenAlbums(store: store.self)
                .onTapGesture {
                    selectedTab = "WillListen"
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
