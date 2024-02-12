//
//  InventoryView.swift
//  CsSkinsLite
//
//  Created by Bruno Thuma on 25/01/24.
//

import SwiftUI
import Alamofire
import AlamofireImage
import FirebaseAnalytics

struct InventoryItem: Decodable {
    let name: String
    let image: String
}

struct InventoryView: View {
    let userID: String
    @State private var inventoryItems: [InventoryItem] = []
    
    var body: some View {
        List(inventoryItems, id: \.name) { item in
            HStack {
                Text(item.name)
                Spacer()
                URLImageView(urlString: item.image)
                    .frame(width: 50, height: 50)
            }
        }
        .onAppear {
            fetchInventory()
        }
        .navigationTitle("Inventory")
    }
    
    private func fetchInventory() {
        // Replace "YOUR_STEAM_API_KEY" with your actual Steam API key
        let apiKey = "YOUR_STEAM_API_KEY"
        let steamInventoryURL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key=\(apiKey)&steamid=\(userID)"
        
        AF.request(steamInventoryURL)
            .validate()
            .responseDecodable(of: SteamInventoryResponse.self) { response in
                switch response.result {
                case .success(let inventoryResponse):
                    inventoryItems = inventoryResponse.result.items
                case .failure(let error):
                    print("Error fetching inventory: \(error)")
                }
            }
        
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: "id-inv",
          AnalyticsParameterItemName: "InventoryFetch",
          AnalyticsParameterContentType: "cont",
        ])
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(userID: "steamUserID")
    }
}
