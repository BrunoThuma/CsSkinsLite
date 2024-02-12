//
//  SteamModels.swift
//  CsSkinsLite
//
//  Created by Bruno Thuma on 26/01/24.
//

import SwiftUI

import Foundation

struct SteamInventoryResponse: Decodable {
    let result: SteamInventoryResult
}

struct SteamInventoryResult: Decodable {
    let items: [InventoryItem]
}
