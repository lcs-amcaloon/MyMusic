//
//  Album Cell.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-28.
//

import SwiftUI

struct Album_Cell: View {
    
    @ObservedObject var album: Album
    
    @Binding var triggerListUpdate: Bool
    
    var body: some View {
        
        HStack{
            Text(album.AlbumName)
            Text(album.Artist)
            
            if album.AlbumRating > 0 {
                Text("Rating: \(album.AlbumRating)")
            }
        }
    }
}

struct Album_Cell_Previews: PreviewProvider {
    static var previews: some View {
        Album_Cell(album: testData[0], triggerListUpdate: .constant(true))
        Album_Cell(album: testData[1], triggerListUpdate: .constant(true))

    }
}
