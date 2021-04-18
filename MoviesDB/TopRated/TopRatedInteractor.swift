//
//  TopRatedInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class TopRatedInteractor: TopRatedInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: TopRatedInteractorOutputProtocol?
    var localDatamanager: TopRatedLocalDataManagerInputProtocol?
    var remoteDatamanager: TopRatedRemoteDataManagerInputProtocol?

}

extension TopRatedInteractor: TopRatedRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
