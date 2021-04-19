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
        print("Vista PRINT [PAV] \(movie)")
        if let movieReceived = movie {
            view?.showMovieDetail(with: movieReceived)
        }
    }
    func getMovieDetail(with id: Int) {
        interactor?.getMovieDetail(from: id)
        view?.starAndShowSpinner()
    }
    
    func saveFavorite(with value: Bool) {
        interactor?.saveFavorite(with: value)
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {

    // TODO: implement interactor output methods
    func interactorCallBackToPresenter(with data: MovieDetail) {
        view?.stopAndHideSpinner()
        view?.showFullMovieDetail(with: data)
    }
    
    func interactorGetFavoriteToPresenter(with value: Bool) {
        view?.updateFavoriteState(with: value)
    }
    
    
}
