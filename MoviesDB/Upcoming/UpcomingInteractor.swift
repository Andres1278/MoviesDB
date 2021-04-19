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
    
    func getRemoteData() {
        remoteDatamanager?.getUpcomingData()
    }
    
    func getNextPage(from page: Int) {
        remoteDatamanager?.getNextPage(from: page)
    }
    
}

extension UpcomingInteractor: UpcomingRemoteDataManagerOutputProtocol {
    func callBackToInteractor(with data: MovieQueryResponse<Movie>) {
        presenter?.interarCallBackToPresenter(with: data)
    }
    
    // TODO: Implement use case methods
}
