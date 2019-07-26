//
//  UIImageView+URLSession.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFromURLString(_ url: String, completion: (() -> ())? = nil) {
        guard let url = URL(string: url) else {
            completion?()
            return
        }
        URLSession.shared.dataTask( with: url, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  .scaleAspectFit
                self.layer.cornerRadius = 6.0
                if let data = data {
                    let image = UIImage(data: data)
                    self.image = image
                } else {
                    self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                }
                completion?()
            }
        }).resume()
    }
}
