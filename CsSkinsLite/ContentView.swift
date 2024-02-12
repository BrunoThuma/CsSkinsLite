//
//  ContentView.swift
//  CsSkinsLite
//
//  Created by Bruno Thuma on 25/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userID: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Steam User ID", text: $userID)
                    .padding()
                
                NavigationLink(destination: InventoryView(userID: userID)) {
                    Text("Fetch Inventory")
                        .padding()
                }
            }
            .navigationTitle("Steam Inventory Viewer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
