//
//  UIImageView+Alamofire.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 19/04/21.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(with url: URL, placeholder: UIImage? = nil) {
        image = placeholder
        af.setImage(withURL: url, completion: { [weak self] response in
            guard response.error == nil else {
                self?.image = placeholder
                return
            }
        })
    }
}
