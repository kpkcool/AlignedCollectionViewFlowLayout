//
//  Helpers.swift
//  AlignedCollectionViewFlowLayout
//
//  Created by K Praveen Kumar on 06/10/23.
//

import UIKit

class ImageLoader {
    static func loadImage(from url: URL, into imageView: UIImageView) {
        // Create a URLSessionDataTask to fetch the image data
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }

            // Ensure there is data and create an image from it
            if let data = data, let image = UIImage(data: data) {
                // Update the UI on the main thread
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }.resume() // Start the data task
    }
}

extension UIView {
    func fillSuperview() {
        guard let superview = superview else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
