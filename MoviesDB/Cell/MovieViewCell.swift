//
//  MovieViewCell.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//

import UIKit
import Cosmos
import Alamofire
import AlamofireImage

class MovieViewCell: UICollectionViewCell {

    @IBOutlet weak var titeLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var raitingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
        NSLayoutConstraint.activate([
                                        contentView.leftAnchor.constraint(equalTo: leftAnchor),
                                        contentView.rightAnchor.constraint(equalTo: rightAnchor),
                                        contentView.topAnchor.constraint(equalTo: topAnchor),
                                        contentView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    func configure(with movie: Movie) {
        titeLabel.text = movie.title
        guard let url = movie.posterUrl(), let raiting = movie.voteAverage else {
            return
        }
        
//        MARK: GET IMAGE WITH ALAMOFIRE 
        posterView.setImage(with: url)
        
//        MARK: GET IMAGE WITHOUT ALAMOFIRE
//        DispatchQueue.init(label: "imageDownload").async { [weak self] in
//            do {
//                let data = try Data(contentsOf: url)
//                DispatchQueue.main.async {
//                    self?.posterView.image = UIImage(data: data)
//                }
//            } catch {
//                print("Can't find the image from url \(error.localizedDescription)")
//            }
//        }
        
        raitingView.rating = raiting / 2
        
    }
    
    func setupUI() {
        titeLabel.UILableTextShadow(textColor: .white)
        raitingView.settings.updateOnTouch = false
        posterView.layer.cornerRadius = 15
        raitingView.settings.fillMode = .precise
        let gradient = CAGradientLayer()
        gradient.frame = posterView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.5
        posterView.layer.insertSublayer(gradient, at: 0)
    }
    
    override public func prepareForReuse() {
         // Ensures the reused cosmos view is as good as new
         raitingView.prepareForReuse()
       }

}
