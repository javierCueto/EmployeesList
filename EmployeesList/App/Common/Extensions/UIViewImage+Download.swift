//
//  UIViewImage+Download.swift
//  EmployeesList
//
//  Created by Javier Cueto on 26/07/22.
//

import UIKit

extension UIImageView {
    func setImageFromNetwork(withURL url: URL?, imageStorage: ImageStorage = ImageStorage()) {
        addDefaultImage()
        guard
            let url = url
        else {
            return
        }
        
        if imageInCache(imageStorage , with: url) {
            return
        } else {
            downLoadImage(imageStorage , with: url)
        }
    }
    
    private func imageInCache(_ imageStorage: ImageStorage ,with url: URL) -> Bool {
        if let image = imageStorage.get(url: url) {
            self.image = image
            return true
        }
        return false
    }
    
    private func downLoadImage(_ imageStorage: ImageStorage ,with url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    imageStorage.save(url: url, image: image)
                }
            }
        }
    }
    
    private func addDefaultImage() {
        let defaultImage: UIImage? = UIImage(named: "profile")
        image = defaultImage
    }
}
