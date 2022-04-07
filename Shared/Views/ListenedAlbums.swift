//
//  ListenedAlbums.swift
//  MyMusic (iOS)
//
//  Created on 2022-03-30.
//

import SwiftUI

struct ListenedAlbums: View {
    
    @ObservedObject var store: AlbumStore
    
    @State private var showingAddAlbum = false
    
    @State private var selectedResultVisibility: ResultVisibility = .all
    
    
    
    var body: some View {
        
        VStack {

            List {
                ForEach(filter(store.albums, by: selectedResultVisibility)) { album in

                    if album.AlbumRating == "0/5" {

                    } else {
                        Album_Cell(album: album, triggerListUpdate: .constant(true))
                    }
                    
                }
                
            }
            
            Text("Filter by...")
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
            Picker("Filter", selection: $selectedResultVisibility) {
                Text(ResultVisibility.all.rawValue)
                    .tag(ResultVisibility.all)
                Text(ResultVisibility.one.rawValue)
                    .tag(ResultVisibility.one)
                Text(ResultVisibility.two.rawValue)
                    .tag(ResultVisibility.two)
                Text(ResultVisibility.three.rawValue)
                    .tag(ResultVisibility.three)
                Text(ResultVisibility.four.rawValue)
                    .tag(ResultVisibility.four)
                Text(ResultVisibility.five.rawValue)
                    .tag(ResultVisibility.five)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            
            
        }
        .padding(.bottom)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add") {
                    showingAddAlbum = true
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
        }
        .sheet(isPresented: $showingAddAlbum) {
            AddAlbum(store: store, showing: $showingAddAlbum)
        }
        .navigationTitle("Have Listened To")
        
    }
    func filter(_ listOfResults: [Album], by visibilty: ResultVisibility) -> [Album] {
        
        if visibilty == .all {
            return listOfResults
        } else {
            
            var filteredResults: [Album] = []
            
            for currentResult in listOfResults {
                
                if visibilty == .one && currentResult.AlbumRating == "1/5" {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .two && currentResult.AlbumRating == "2/5" {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .three && currentResult.AlbumRating == "3/5" {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .four && currentResult.AlbumRating == "4/5" {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .five && currentResult.AlbumRating == "5/5" {
                    filteredResults.insert(currentResult, at: 0)
                }
                
            }
            
            return filteredResults
            
        }
        
    }
}

struct ListenedAlbums_Previews: PreviewProvider {
    static var previews: some View {
        ListenedAlbums(store: testStore)
    }
}
