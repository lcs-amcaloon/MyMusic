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
    @State private var ratingValue: Double = 0
    @State private var completedAlbum: Bool = true
    
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
                        
                        Slider(value: $ratingValue, in: 1...10)
                        Text("Album Rating: \(ratingValue, specifier: "%.2f")")
                    }
                }
                
            }
            .navigationTitle("Add an Album")
        }
        //ToolbarItem(placement: .cancellationAction) {
            //Button("Cancel") {
                //showing = false
                
                    
            //}
        //}
}

struct AddAlbum_Previews: PreviewProvider {
    static var previews: some View {
        AddAlbum(showing: .constant(true))
    }
}
}
