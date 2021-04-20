//
//  Extensions.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 18/04/21.
//

import Foundation
import UIKit

extension UILabel {
   func UILableTextShadow(textColor: UIColor){
      self.textColor = textColor
      self.layer.masksToBounds = false
      self.layer.shadowOffset = CGSize(width: 1, height: 1)
      self.layer.rasterizationScale = UIScreen.main.scale
      self.layer.shadowRadius = 5.0
      self.layer.shadowOpacity = 0.6
   }
}
