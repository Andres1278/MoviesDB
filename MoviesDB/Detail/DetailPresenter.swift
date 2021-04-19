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
    var localInfo: LocalInfoMovie?
}

extension DetailPresenter: DetailPresenterProtocol {
    

    
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("Vista PRINT [PAV] \(movie)")
        if let movieReceived = movie {
            view?.showMovieDetail(with: movieReceived)
        }

    }

    func getMovieLocalInfo(with id: Int) {
        interactor?.getMovieLocalInfo(with: id)
    }
    
    
    func setMovieLocalInfo(with data: LocalInfoMovie) {
        view?.setLocalDataInfoToview(with: data)
    }
    
    func getMovieDetail(with id: Int) {
        interactor?.getMovieDetail(from: id)
        view?.starAndShowSpinner()
    }
    
    func saveLocalMovieInfo(with info: LocalInfoMovie) {
        interactor?.saveLocalMovieInfo(with: info)
    }
    
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {

    // TODO: implement interactor output methods
    func interactorCallBackToPresenter(with data: MovieDetail) {
        view?.stopAndHideSpinner()
        view?.showFullMovieDetail(with: data)
    }

    func interactorGetLocalInfoToPresenter(with data: LocalInfoMovie) {
        view?.setLocalDataInfoToview(with: data)
    }
    
    
    
}
