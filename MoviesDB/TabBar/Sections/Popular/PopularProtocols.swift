//
//  PopularProtocols.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

protocol PopularViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: PopularPresenterProtocol? { get set }
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>)
    func starAndShowSpinner()
    func stopAndHideSpinner()
}

protocol PopularWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createPopularModule() -> UIViewController
    func presentDetailView(from view: PopularViewProtocol, with movie: Movie)
}

protocol PopularPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: PopularViewProtocol? { get set }
    var interactor: PopularInteractorInputProtocol? { get set }
    var wireFrame: PopularWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with movie: Movie)
    func loadNextPage(from page: Int)
}

protocol PopularInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorCallBack(with data: MovieQueryResponse<Movie>)
}

protocol PopularInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PopularInteractorOutputProtocol? { get set }
    var localDatamanager: PopularLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PopularRemoteDataManagerInputProtocol? { get set }
    func getRemoteData()
    func getNextPage(from page: Int)
}

protocol PopularDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PopularRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PopularRemoteDataManagerOutputProtocol? { get set }
    func getPopularData()
    func getNextPage(from page: Int)
}

protocol PopularRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackData(with data: MovieQueryResponse<Movie>)
}

protocol PopularLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
