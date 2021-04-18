//
//  HomeInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    
    func getRemoteData() {
        remoteDatamanager?.getNowPlayingData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func callBackData(with response: MovieQueryResponse<Movie>) {
        presenter?.interactorCallBack(withData: response)
    }
}
