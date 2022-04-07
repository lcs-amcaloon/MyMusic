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
                
                ForEach(searchFilter(originalList: store.albums, using: searchTerm)) { album in

                    if showingCompletedAlbums {
                        
                        if album.AlbumRating == "0/5" {
                            Album_Cell(album: album, triggerListUpdate: .constant(true))
                        }

                    }
                    
                }
                .onDelete(perform: store.deleteAlbums)
                .onMove(perform: store.moveAlbums)
                
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
            .sheet(isPresented: $showingAddAlbum) {
                AddAlbum(store: store, showing: $showingAddAlbum)
            }
            .navigationTitle("Will Listen to")
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
    }
    

    
    func searchFilter(originalList: [Album], using term: String) -> [Album] {
        
        if term.isEmpty {
            return originalList
        } else {
            
            var filteredList: [Album] = [Album(AlbumName: "Donda", Artist: "Kanye West", ListenStatus: AlbumStatus.willListen, AlbumRating: "0/5")]
            
            for currentSession in originalList {
                if currentSession.Artist.contains(term) {
                    filteredList.append(currentSession)
                }
            }
            filteredList.removeFirst()
            return filteredList
        }
        
    }
    
}

struct WillListenAlbums_Previews: PreviewProvider {
    static var previews: some View {
        WillListenAlbums(store: testStore)
    }
}
