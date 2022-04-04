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
                    Text(ResultVisibility.three.rawValue)
                        .tag(ResultVisibility.three)
                    Text(ResultVisibility.four.rawValue)
                        .tag(ResultVisibility.four)
                    Text(ResultVisibility.five.rawValue)
                        .tag(ResultVisibility.five)
                    Text(ResultVisibility.six.rawValue)
                        .tag(ResultVisibility.six)
                    Text(ResultVisibility.seven.rawValue)
                        .tag(ResultVisibility.seven)
                    Text(ResultVisibility.eight.rawValue)
                        .tag(ResultVisibility.eight)
                    Text(ResultVisibility.nine.rawValue)
                        .tag(ResultVisibility.nine)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                List(filter(results, by: selectedResultVisibility)) { album in
                    
                    //ForEach(store.albums) { album in
                            
                            //if album.AlbumRating > 0 {
                                Album_Cell(album: album, triggerListUpdate: .constant(true))
                                
                            //}
                            
                        
                        
                    //}
                    //.onDelete(perform: store.deleteAlbums)
                   // .onMove(perform: store.moveAlbums)
                    
                    
                    
                }
                
            }
            .padding(.bottom)
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
                
                if visibilty == .one && currentResult.AlbumRating == 1 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .two && currentResult.AlbumRating == 2 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .three && currentResult.AlbumRating == 3 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .four && currentResult.AlbumRating == 4 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .five && currentResult.AlbumRating == 5 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .six && currentResult.AlbumRating == 6 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .seven && currentResult.AlbumRating == 7 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .eight && currentResult.AlbumRating == 8 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .nine && currentResult.AlbumRating == 9 {
                    filteredResults.insert(currentResult, at: 0)
                } else if visibilty == .ten && currentResult.AlbumRating == 10 {
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
