//
//  UIImageView+URLSession.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFromURLString(_ url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask( with: url, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  .scaleAspectFit
                self.layer.cornerRadius = 6.0
                if let data = data {
                    self.image = UIImage(data: data)
                } else {
                    self.backgroundColor = #colorLiteral(red: 0.8936555982, green: 0.8943349719, blue: 0.8937607408, alpha: 1)
                }
            }
        }).resume()
    }
}
