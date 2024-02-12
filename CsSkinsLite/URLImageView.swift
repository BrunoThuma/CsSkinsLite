//
//  URLImageView.swift
//  CsSkinsLite
//
//  Created by Bruno Thuma on 25/01/24.
//

import SwiftUI
import AlamofireImage
import Alamofire

struct URLImageView: View {
    let urlString: String
    @State private var image: SwiftUI.Image? = nil
    
    var body: some View {
        
        if let image = image {
            image
                .resizable()
                .scaledToFit()
        } else {
            // Placeholder image or loading indicator
            Text("Loading...")
        }
        Text("Salve")
            .onAppear {
                loadImage()
            }
    }
    
    private func loadImage() {
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).responseImage { response in
                if case .success(let downloadedImage) = response.result {
                    image = Image(uiImage: downloadedImage)
                }
            }
    }
}
