//
//  MovieViewCell.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//

import UIKit

class MovieViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with movie: Movie) {
        label.text = movie.title
    }

}
