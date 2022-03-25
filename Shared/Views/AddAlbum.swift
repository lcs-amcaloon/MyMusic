//
//  AddAlbum.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-25.
//

import SwiftUI

struct AddAlbum: View {
    
    @State private var AlbumName = ""
    @State private var Artist = ""
    @State private var ListenStatus = AlbumStatus.listened
    
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    TextField("Album Name", text: $AlbumName)
                    TextField("Artist", text: $Artist)
                    Picker("ListenStatus", selection: $ListenStatus) {
                        Text(AlbumStatus.listened.rawValue)
                            .tag(AlbumStatus.listened)
                        Text(AlbumStatus.willListen.rawValue)
                            .tag(AlbumStatus.willListen)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
            }
            .navigationTitle("Add a Album")
        }
    }
}

struct AddAlbum_Previews: PreviewProvider {
    static var previews: some View {
        AddAlbum()
    }
}
