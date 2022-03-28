//
//  MyMusicApp.swift
//  Shared
//
//  Created by Angus McAloon on 2022-03-25.
//

import SwiftUI

@main
struct MyMusicApp: App {
    
    @StateObject private var store = AlbumStore(albums: testData)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(store: store)
            }
        }
    }
}
