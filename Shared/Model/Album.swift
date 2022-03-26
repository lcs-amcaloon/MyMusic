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
    var completedAlbum: Bool
    
    internal init(id: UUID = UUID(), AlbumName: String, Artist: String, ListenStatus: AlbumStatus, completedAlbum: Bool) {
        self.id = id
        self.AlbumName = AlbumName
        self.Artist = Artist
        self.ListenStatus = ListenStatus
        self.completedAlbum = completedAlbum
    }
}
