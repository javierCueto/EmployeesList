//
//  ImageStorage.swift
//  EmployeesList
//
//  Created by Javier Cueto on 26/07/22.
//

import UIKit

protocol ImageWriteable {
    func save(url: URL, image: UIImage)
}

protocol ImageReadable {
    func get(url: URL) -> UIImage?
}


struct ImageStorage {
    static var cache = NSCache<NSString, UIImage>()
}

extension ImageStorage: ImageWriteable{
    func save(url: URL, image: UIImage) {
        ImageStorage.cache.setObject(image, forKey: url.absoluteString as NSString)
    }

}

extension ImageStorage: ImageReadable{
    func get(url: URL) -> UIImage? {
        return ImageStorage.cache.object(forKey: url.absoluteString as NSString)
    }
}
