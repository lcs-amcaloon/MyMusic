//
//  Album.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-25.
//

import Foundation

class Album: Identifiable, ObservableObject {
    var id = UUID()
    var AlbumName: String
    var Artist: String
    var ListenStatus: AlbumStatus
    var AlbumRating: Double
    
    internal init(id: UUID = UUID(), AlbumName: String, Artist: String, ListenStatus: AlbumStatus, AlbumRating: Double) {
        self.id = id
        self.AlbumName = AlbumName
        self.Artist = Artist
        self.ListenStatus = ListenStatus
        self.AlbumRating = AlbumRating
    }
}

let testData = [
    Album(AlbumName: "Coloring Book", Artist: "Chance the Rapper", ListenStatus: AlbumStatus.listened, AlbumRating: 7),
    Album(AlbumName: "Donda", Artist: "Kanye West", ListenStatus: AlbumStatus.willListen, AlbumRating: 0)

]
