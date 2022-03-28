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
    
    var body: some View {
        
        List {
            
            ForEach(store.albums) { album in
                
                if showingCompletedAlbums {
                    Album_Cell(album: album, triggerListUpdate: .constant(true))
                }
                //else {
                    
                    //if album.completedAlbum == false {
                        //Album_Cell(album: album, triggerListUpdate: $listShouldUpdate)
                    //}
                    
                //}
                
                
            }
            .onDelete(perform: store.deleteAlbums)
            .onMove(perform: store.moveAlbums)
            
        }
        .navigationTitle("Albums")
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
        .sheet(isPresented: $showingAddAlbum) {
            AddAlbum(store: store, showing: $showingAddAlbum)
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
