//
//  UpcomingProtocols.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

protocol UpcomingViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: UpcomingPresenterProtocol? { get set }
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>)
    func starAndShowSpinner()
    func stopAndHideSpinner()
}

protocol UpcomingWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createUpcomingModule() -> UIViewController
    func presentDetailView(from view: UpcomingViewProtocol, with movie: Movie)
}

protocol UpcomingPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: UpcomingViewProtocol? { get set }
    var interactor: UpcomingInteractorInputProtocol? { get set }
    var wireFrame: UpcomingWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with movie: Movie)
    func loadNextPage(from page: Int)
}

protocol UpcomingInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interarCallBackToPresenter(with data: MovieQueryResponse<Movie>)
}

protocol UpcomingInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: UpcomingInteractorOutputProtocol? { get set }
    var localDatamanager: UpcomingLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UpcomingRemoteDataManagerInputProtocol? { get set }
    func getRemoteData()
    func getNextPage(from page: Int)
}

protocol UpcomingDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol UpcomingRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UpcomingRemoteDataManagerOutputProtocol? { get set }
    func getUpcomingData()
    
    func getNextPage(from page: Int)
}

protocol UpcomingRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackToInteractor(with data: MovieQueryResponse<Movie>)
}

protocol UpcomingLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
