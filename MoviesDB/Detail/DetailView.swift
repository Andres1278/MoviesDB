//
//  DetailView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit
import Cosmos
import RxSwift
import RxCocoa

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var id: Int?
    private let disposeBag = DisposeBag()
    var isFavoriteMovie = false
    var raitingPersonal: Double? = 0
    
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
    @IBOutlet weak var raitingView: CosmosView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var rateLocalLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        guard let localID = id else { return }
        setObservers()
        presenter?.getMovieDetail(with: localID)
        presenter?.getMovieLocalInfo(with: localID)
    }
    
    func setObservers() {
        
        favButton.rx.tap.bind {
            self.isFavoriteMovie.toggle()
            self.saveMovieLocalInfo()
            self.presenter?.getMovieLocalInfo(with: self.id!)
        }.disposed(by: disposeBag)
        
        raitingView.didTouchCosmos = { personalRaiting in
            self.raitingPersonal = self.raitingView.rating
            self.saveMovieLocalInfo()
        }
    }
    
    func saveMovieLocalInfo() {
        if let movieID = self.id, let raiting = self.raitingPersonal {
            let movieInfo = LocalInfoMovie()
            movieInfo.favorite = self.isFavoriteMovie
            movieInfo.id = movieID
            movieInfo.raitingPersonal = raiting
            self.presenter?.saveLocalMovieInfo(with: movieInfo)
        }
    }
    
    func setupUI() {
        cardView.layer.cornerRadius = 25
        cardView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.78)
        popularitySlider.setThumbImage(UIImage(systemName: "bolt.circle.fill"), for: .normal)
        raitingView.settings.fillMode = .precise
        let gradient = CAGradientLayer()
        gradient.frame = posterView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.7
        posterView.layer.insertSublayer(gradient, at: 0)
        movieTitleLabel.UILableTextShadow(textColor: .white)
        rateLocalLabel.UILableTextShadow(textColor: .white)
        favoriteLabel.UILableTextShadow(textColor: .white)
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
        languageLabel.text = movie.original_language ?? "en"
        
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
    
    func setLocalDataInfoToview(with data: LocalInfoMovie) {
        favButton.setImage( UIImage(systemName: data.favorite ? "heart.fill" : "heart"), for: .normal)
        raitingView.rating = data.raitingPersonal
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
        posterView.setImage(with: url)
    }

    
    func showMovieDetail(with movie: Movie) {
        movieTitleLabel.text = movie.title
        id = movie.id
    }

}
