//
//  HomeInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation

class NowPlayingInteractor: NowPlayingInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: NowPlayingInteractorOutputProtocol?
    var localDatamanager: NowPlayingLocalDataManagerInputProtocol?
    var remoteDatamanager: NowPlayingRemoteDataManagerInputProtocol?

    
    func getRemoteData() {
        remoteDatamanager?.getNowPlayingData()
    }
}

extension NowPlayingInteractor: NowPlayingRemoteDataManagerOutputProtocol {
    func callBackData(with response: MovieQueryResponse<Movie>) {
        presenter?.interactorCallBack(withData: response)
    }
}
