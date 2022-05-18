//
//  LazyImageView.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import Foundation
import UIKit

class LazyImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromUrl imageURL: String, placeHolderImage: String) {
        self.image = UIImage(named: placeHolderImage)
        
        
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        
        guard let imgUrl = URL(string: imageURL) else {return}
        
        DispatchQueue.global().async {[weak self] in
            if let imageData = try? Data(contentsOf: imgUrl) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async { [weak self] in
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    
                    }
                }
            }
        }
    }
}
