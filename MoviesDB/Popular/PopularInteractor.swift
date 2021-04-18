//
//  PopularInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class PopularInteractor: PopularInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: PopularInteractorOutputProtocol?
    var localDatamanager: PopularLocalDataManagerInputProtocol?
    var remoteDatamanager: PopularRemoteDataManagerInputProtocol?

}

extension PopularInteractor: PopularRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
