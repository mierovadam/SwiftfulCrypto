//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 19/12/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscribtion: AnyCancellable?
    private let coin: CoinModel
    private let fileNamager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileNamager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from file manager!")
        } else {
            downloadCoinImage()
            print("Downloading image now.")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscribtion = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return}
                self.image = returnedImage
                self.imageSubscribtion?.cancel()
                self.fileNamager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
