//
//  Album.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-25.
//

import Foundation

class Album: Identifiable, ObservableObject {
    var id = UUID()
    var AlbumName: String
    var Artist: String
    var ListenStatus: AlbumStatus
    var AlbumRating: String
    
    internal init(id: UUID = UUID(), AlbumName: String, Artist: String, ListenStatus: AlbumStatus, AlbumRating: String) {
        self.id = id
        self.AlbumName = AlbumName
        self.Artist = Artist
        self.ListenStatus = ListenStatus
        self.AlbumRating = AlbumRating
    }
}

let testData = [
    Album(AlbumName: "Coloring Book", Artist: "Chance the Rapper", ListenStatus: AlbumStatus.listened, AlbumRating: "4/5"),
    Album(AlbumName: "Donda", Artist: "Kanye West", ListenStatus: AlbumStatus.willListen, AlbumRating: "0/5")

]
