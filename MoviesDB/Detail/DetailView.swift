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
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var popularitySlider: UISlider!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        guard let localID = id else { return }
        presenter?.getMovieDetail(with: localID )
    }
}

extension DetailView: DetailViewProtocol {
    
    // TODO: implement view output methods
    func showFullMovieDetail(with movie: MovieDetail) {
        print("------VIEW MOVIE DETAIL ----- \(movie)")
        setImage(with: movie)
        movieTitleLabel.text = movie.original_title
        movieOverview.text = movie.overview
        languageLabel.text = movie.original_language
        raitingLabel.text = "\(movie.vote_average)"
        popularitySlider.value = Float( movie.popularity ?? 0)
    }
    
    func starAndShowSpinner() {
        
    }
    
    func stopAndHideSpinner() {
        
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
