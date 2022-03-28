//
//  Album Store.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-28.
//

import Foundation

class AlbumStore: ObservableObject {
    
    @Published var albums: [Album]
    
    init(albums: [Album] = []) {
        self.albums = albums
    }
    
    func deleteAlbums(at offsets: IndexSet){
        
        albums.remove(atOffsets: offsets)
        
    }
    
    func moveAlbums(from source: IndexSet, to destination: Int) {
        
        albums.move(fromOffsets: source, toOffset: destination)
        
    }
    
}

var testStore = AlbumStore(albums: testData)
