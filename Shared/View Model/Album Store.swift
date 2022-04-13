//
//  Album Store.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-28.
//

import Foundation

class AlbumStore: ObservableObject {
    
    @Published var albums: [Album]
    
    init(albums: [Album] = []) {
        self.albums = albums
    }
    
}

var testStore = AlbumStore(albums: testData)
