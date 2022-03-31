//
//  ListenedAlbums.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-30.
//

import SwiftUI

struct ListenedAlbums: View {
    
    @ObservedObject var store: AlbumStore
    
    @State private var showingAddAlbum = false
    
    @State var showingCompletedAlbums = true
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Listened")
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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
    }
}

struct ListenedAlbums_Previews: PreviewProvider {
    static var previews: some View {
        ListenedAlbums(store: testStore)
    }
}
