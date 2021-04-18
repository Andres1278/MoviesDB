//
//  DetailPresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var movie: Movie?
}

extension DetailPresenter: DetailPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("Vista PRINT \(movie)")
        if let movieReceived = movie {
            view?.showMovieDetail(with: movieReceived)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
