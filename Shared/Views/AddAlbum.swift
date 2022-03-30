//
//  AddAlbum.swift
//  MyMusic (iOS)
//
//  Created by Angus McAloon on 2022-03-25.
//

import SwiftUI

struct AddAlbum: View {
    
    @ObservedObject var store: AlbumStore
    
    @State private var AlbumName = ""
    @State private var Artist = ""
    @State private var ListenStatus = AlbumStatus.listened
    @State private var AlbumRating: Double = 0
    
    @Binding var showing: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    TextField("Album Name", text: $AlbumName)
                    TextField("Artist", text: $Artist)
                    
                    Picker("ListenStatus", selection: $ListenStatus){
                        Text(AlbumStatus.listened.rawValue)
                            .tag(AlbumStatus.listened)
                        Text(AlbumStatus.willListen.rawValue)
                            .tag(AlbumStatus.willListen)
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    if ListenStatus == AlbumStatus.listened{
                        
                        Slider(value: $AlbumRating, in: 1...10)
                        Text("Album Rating: \(AlbumRating, specifier: "%.2f")")
                    }
                }
                
            }
            .navigationTitle("Add an Album")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        saveAlbum()
                    }
                    .disabled(AlbumName.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showing = false
                    }
                }
            }
        }
        .interactiveDismissDisabled()
}

    func saveAlbum() {
        store.albums.append(Album(AlbumName: AlbumName, Artist: Artist, ListenStatus: ListenStatus, AlbumRating: AlbumRating))
        
        showing = false
    }
    
struct AddAlbum_Previews: PreviewProvider {
    static var previews: some View {
        AddAlbum(store: testStore, showing: .constant(true))
    }
}
}
