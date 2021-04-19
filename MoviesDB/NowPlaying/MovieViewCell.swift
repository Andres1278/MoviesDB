//
//  MovieViewCell.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieViewCell: UICollectionViewCell {

    @IBOutlet weak var titeLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
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
        languageLabel.text = movie.original_language ?? "EN"
        guard let url = movie.posterUrl(), let raiting = movie.voteAverage else {
            return
        }
        
        AF.request(url).responseImage { [weak self] response in
            if case .success(let image) = response.result {
                self?.posterView.image = image
            }
            
        }
        
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
        
        voteLabel.text = "\(raiting)"
        
    }
    
    func setupUI() {
        posterView.layer.cornerRadius = 15
        let gradient = CAGradientLayer()
        gradient.frame = posterView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.5
        posterView.layer.insertSublayer(gradient, at: 0)
    }

    
//    let url = pokemon.sprites.front_default
//    do {
//        let data = try Data(contentsOf: url)
//        self.imageView.image = UIImage(data: data)
//    } catch {
//        print("Can't find the image from url \(error.localizedDescription)")
//    }
}
