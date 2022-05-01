//
//  CustomImageView.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var task: URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: .medium)

    func loadImage(from url: URL) {
        image = nil

        addSpinner()

        if let task = task{
            task.cancel()
        }
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            self.removeSpinner()
            return
        }

        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let newImage = UIImage(data: data)
            else {
                print("couldn't load image from url: \(url)")
                return
            }

        imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
        DispatchQueue.main.async {
            self.image = newImage
            }
        }

        task.resume()
    }
    private func addSpinner() {
        addSubview(spinner)

        spinner.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
                spinner.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
        spinner.startAnimating()

    }
    private func removeSpinner() {
        spinner.removeFromSuperview()
    }
}
