//
//  DetailProtocols.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func showMovieDetail(with movie: Movie)
    func starAndShowSpinner()
    func stopAndHideSpinner()
    func showFullMovieDetail(with movie: MovieDetail)
}

protocol DetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with movie: Movie) -> UIViewController
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var movie: Movie? { get set }
    func viewDidLoad()
    func getMovieDetail(with id: Int)
}

protocol DetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorCallBackToPresenter(with data: MovieDetail)
}

protocol DetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    func getMovieDetail(from id: Int)
}

protocol DetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    func getMovieDetailData(with id: Int)
}

protocol DetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackDataToInteractor(with data: MovieDetail)
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
