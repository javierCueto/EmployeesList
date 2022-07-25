//
//  UIView+Constraints.swift
//  EmployeesList
//
//  Created by Javier Cueto on 25/07/22.
//

import UIKit

extension UIView {
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = 0,
        pRight: CGFloat = 0,
        pBottom: CGFloat = 0,
        pLeft: CGFloat = 0
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
        
    }
    
    func width(size: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
    }
    
}



var imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func setImageFromNetwork(withURL url: URL?) {
        
        guard let url = url else { return }
        // if there is url key saved in cache the image will be returned
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                self.image = image
            }
            return
        } else {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if self.imageOnError(error: error) {
                    return
                } else {
                    self.imageInData(data: data, response: response, url: url)
                }
            }
            dataTask.resume()
        }
    }
    
    // If there is a error the image returned will be default on the cell
    private func imageOnError(error: Error?) -> Bool {
        if let error = error {
            DispatchQueue.main.async {
                self.image = UIImage(named: "profile") ?? UIImage()
            }
            return true
        }
        return false
    }
    
    // Here the is two possibilities: data is a image or just another kind of pase
    private func imageInData(data: Data?, response: URLResponse?, url: URL) {
        if let data = data {
            let downloadedImage = UIImage(data: data)
            // if the downloadedImage is not nil will be the image for the cell and it will be saved in cache
            if downloadedImage != nil {
                DispatchQueue.main.async {
                    imageCache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
                    self.image = downloadedImage
                }
            } else {
                // if there is not error and the response is not a image, default image will be returned and saved in cache
                DispatchQueue.main.async {
                    let defaultImage: UIImage? = UIImage(named: "profile")
                    self.image = defaultImage
                    imageCache.setObject(defaultImage ?? UIImage(), forKey: url.absoluteString as NSString)
                }
                
            }
        }
    }
    
}
