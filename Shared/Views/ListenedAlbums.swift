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
    
    @State var showingCompletedAlbums = true
    
    @State var results: [Album] = []
    
    @State private var selectedResultVisibility: ResultVisibility = .all
    
    var body: some View {
        NavigationView {
            
            VStack {
                    Picker("Filter", selection: $selectedResultVisibility) {
                        Text(ResultVisibility.all.rawValue)
                            .tag(ResultVisibility.all)
                        Text(ResultVisibility.one.rawValue)
                            .tag(ResultVisibility.one)
                        Text(ResultVisibility.two.rawValue)
                            .tag(ResultVisibility.two)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
            }
            .padding(.bottom)
            
            List(filter(results, by: selectedResultVisibility)) { result in
                
                ForEach(store.albums) { album in
                    
                    
                    
                    if showingCompletedAlbums {
                        
                        if album.AlbumRating > 0 {
                            Album_Cell(album: album, triggerListUpdate: .constant(true))
                            
                        }
                        
                    }
                    
                }
                .onDelete(perform: store.deleteAlbums)
                .onMove(perform: store.moveAlbums)
                
                
                
            }
            .navigationTitle("Listened")
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
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
        
    }
    func filter(_ listOfResults: [Album], by visibilty: ResultVisibility) -> [Album] {
        
        if visibilty == .all {
            return listOfResults
        } else {
            
            var filteredResults: [Album] = []
            
            for currentResult in listOfResults {
                
                if visibilty == .one && currentResult.AlbumRating < 2 {
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
