//
//  Album Cell.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-28.
//

import SwiftUI

struct Album_Cell: View {
    
    @ObservedObject var album: Album
    
    @Binding var triggerListUpdate: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Album: ").fontWeight(.bold)
                Text(album.AlbumName)
            }
            HStack {
                Text("Artist: ").fontWeight(.bold)
                Text(album.Artist)
            }
            
            if album.AlbumRating.rawValue == "0/5" {

            } else {
                HStack {
                    Text("Rating: ").fontWeight(.bold)
                    Text("\(album.AlbumRating.rawValue)")
                }
            }

        }
        .padding(.horizontal)

    }
}

struct Album_Cell_Previews: PreviewProvider {
    static var previews: some View {
        Album_Cell(album: testData[0], triggerListUpdate: .constant(true))
        Album_Cell(album: testData[1], triggerListUpdate: .constant(true))

    }
}
