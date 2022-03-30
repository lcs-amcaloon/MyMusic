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
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            List {
                
                ForEach(store.albums) { album in
                    
                    if showingCompletedAlbums {
                        
                        if album.AlbumRating > 0 {
                            Album_Cell(album: album, triggerListUpdate: .constant(true))
                        }

                    }                    
                    
                }
                .onDelete(perform: store.deleteAlbums)
                .onMove(perform: store.moveAlbums)
                
            }
            .navigationTitle("Albums You Have Listened To")
            .sheet(isPresented: $showingAddAlbum) {
                AddAlbum(store: store, showing: $showingAddAlbum)
            }
                .onTapGesture {
                    selectedTab = "Listened"
                }
                .tabItem {
                    Label("Album's Youv'e Listened To", systemImage: "Star")
                }
            
            List {
                
                ForEach(store.albums) { album in
                    
                    if showingCompletedAlbums {
                        
                        if album.AlbumRating == 0 {
                            Album_Cell(album: album, triggerListUpdate: .constant(true))
                        }

                    }
                    
                }
                .onDelete(perform: store.deleteAlbums)
                .onMove(perform: store.moveAlbums)
                
            }
            .navigationTitle("Albums You Will Listen To")
            .sheet(isPresented: $showingAddAlbum) {
                AddAlbum(store: store, showing: $showingAddAlbum)
            }
                .onTapGesture {
                    selectedTab = "Listened"
                }
                .tabItem {
                    Label("Albums You Will Listent To", systemImage: "Circle")
                }
            
                .tabItem {
                    Label("Add Album", systemImage: "Circle")
                }
            
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add") {
                    showingAddAlbum = true
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(store: testStore)
        }
    }
}
