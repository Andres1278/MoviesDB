//
//  DetailView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var id: Int?
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var prodCountriesLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var popularitySlider: UISlider!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        guard let localID = id else { return }
        presenter?.getMovieDetail(with: localID )
    }
    
    func setupUI() {
        cardView.layer.cornerRadius = 25
        cardView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.78)
        popularitySlider.setThumbImage(UIImage(systemName: "bolt.circle.fill"), for: .normal)
        let gradient = CAGradientLayer()
        gradient.frame = posterView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.7
        posterView.layer.insertSublayer(gradient, at: 0)
        movieTitleLabel.UILableTextShadow(textColor: .white)
        tagLine.UILableTextShadow(textColor: .white)
        cardView.layer.shadowColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.layer.shadowRadius = 3
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
}

extension DetailView: DetailViewProtocol {
    
    // TODO: implement view output methods
    func showFullMovieDetail(with movie: MovieDetail) {
        print("------VIEW MOVIE DETAIL ----- \(movie)")
        setImage(with: movie)
        movieTitleLabel.text = movie.title
        movieOverview.text = movie.overview
        languageLabel.text = movie.original_language
        
        guard let popularityValue = movie.popularity, let raiting = movie.vote_average else {
            return
        }
        popularitySlider.setValue(Float(popularityValue), animated: true) 
        raitingLabel.text = "\(raiting)"
        tagLine.text = movie.tagline
        releaseDateLabel.text = movie.release_date
        if let countries = movie.production_countries {
            var countriesArray: [String] = []
            for item in countries {
                countriesArray.append(item.name!)
            }
            let countryString = countriesArray.joined(separator: ", ")
            prodCountriesLabel.text = countryString
        }
        if let genders = movie.genres {
            var gendersArray: [String] = []
            for item in genders {
                gendersArray.append(item.name!)
            }
            let gendersString = gendersArray.joined(separator: ", ")
            genderLabel.text = gendersString
        }
    }
    
    func starAndShowSpinner() {
        spinner.startAnimating()
    }
    
    func stopAndHideSpinner() {
        spinner.stopAnimating()
        spinner.hidesWhenStopped = true
    }
    
    func setImage(with movie: MovieDetail) {
        guard let url = movie.posterUrl() else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            self.posterView.image = UIImage(data: data)
        } catch {
            print("Can't find the image from url \(error.localizedDescription)")
        }
    }

    
    func showMovieDetail(with movie: Movie) {
        movieTitleLabel.text = movie.title
        id = movie.id
    }

}
