//
//  WillListenAlbums.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-30.
//

import SwiftUI

struct WillListenAlbums: View {
    
    @ObservedObject var store: AlbumStore
    
    @State private var showingAddAlbum = false
    
    @State var showingCompletedAlbums = true
    
    @State private var searchTerm = ""
    
    var body: some View {
        
            List {
                
                ForEach(searchFilter(originalList: album.Artist, using: searchTerm)) { album in

                    if showingCompletedAlbums {
                        
                        if album.AlbumRating == 0 {
                            Album_Cell(album: album, triggerListUpdate: .constant(true))
                        }

                    }
                    
                }
                .onDelete(perform: store.deleteAlbums)
                .onMove(perform: store.moveAlbums)
                
            }
            .searchable(text: $searchTerm)
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
            .navigationTitle("Will Listen to")
    }
    
    func searchFilter(originalList: [String], using term: String) -> [String] {
        
        if term.isEmpty {
            return originalList
        } else {
            let temporaryList: [String] = [searchTerm]
            return temporaryList
        }
        
    }
    
}

struct WillListenAlbums_Previews: PreviewProvider {
    static var previews: some View {
        WillListenAlbums(store: testStore)
    }
}
