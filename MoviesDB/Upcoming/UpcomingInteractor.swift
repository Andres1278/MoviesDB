//
//  UpcomingInteractor.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class UpcomingInteractor: UpcomingInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: UpcomingInteractorOutputProtocol?
    var localDatamanager: UpcomingLocalDataManagerInputProtocol?
    var remoteDatamanager: UpcomingRemoteDataManagerInputProtocol?

}

extension UpcomingInteractor: UpcomingRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
