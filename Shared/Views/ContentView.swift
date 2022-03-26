//
//  ContentView.swift
//  Shared
//
//  Created by Angus McAloon on 2022-03-25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddAlbum = false
    
    var body: some View {
        
        //.toolbar {
            //.sheet(isPresented: $showingAddTask) {
                //AddTask(store: store, showing: $showingAddTask)
            
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
