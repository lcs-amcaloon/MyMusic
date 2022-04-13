//
//  AddAlbum.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-25.
//

import SwiftUI

struct AddAlbum: View {
    
    @ObservedObject var store: AlbumStore
    
    @State private var AlbumName = ""
    @State private var Artist = ""
    @State private var ListenStatus = AlbumStatus.listened
    @State private var AlbumRating = Rating.zero
    
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

                        Picker("Rating", selection: $AlbumRating){
                            Text("1/5")
                                .tag(Rating.one)
                            Text("2/5")
                                .tag(Rating.two)
                            Text("3/5")
                                .tag(Rating.three)
                            Text("4/5")
                                .tag(Rating.four)
                            Text("5/5")
                                .tag(Rating.five)
                        }
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
