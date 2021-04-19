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
    
    func getMovieLocalInfo(with id: Int) {
        localDatamanager?.getLocalMovieInfo(with: id)
    }
    

    
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol, DetailLocalDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func callBackDataToInteractor(with data: MovieDetail) {
        presenter?.interactorCallBackToPresenter(with: data)
    }
    
    func getLocalInfoData(with data: LocalInfoMovie) {
        presenter?.interactorGetLocalInfoToPresenter(with: data)
    }
}
