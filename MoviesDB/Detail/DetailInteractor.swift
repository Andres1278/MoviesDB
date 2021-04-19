//
//  DetailInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {


    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

    func getMovieDetail(from id: Int) {
        remoteDatamanager?.getMovieDetailData(with: id)
    }
    
    func saveLocalMovieInfo(with movie: LocalInfoMovie) {
        localDatamanager?.saveLocalMovieInfo(with: movie)
    }
    
    
    
}

extension DetailInteractor: DetailLocalDataManagerInputProtocol {
    func getFavoriteState(with value: Bool) {
        presenter?.interactorGetFavoriteToPresenter(with: value)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func callBackDataToInteractor(with data: MovieDetail) {
        presenter?.interactorCallBackToPresenter(with: data)
    }
}
