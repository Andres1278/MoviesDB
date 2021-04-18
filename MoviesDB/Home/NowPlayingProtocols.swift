//
//  NowPlayingProtocols.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

protocol NowPlayingViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: NowPlayingPresenterProtocol? { get set }
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>)
    func starAndShowSpinner()
    func stopAndHideSpinner()
}

protocol NowPlayingWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    
    func presentDetailView(from view: UIViewController, with movie: Movie)
}

protocol NowPlayingPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: NowPlayingViewProtocol? { get set }
    var interactor: NowPlayingInteractorInputProtocol? { get set }
    var wireFrame: NowPlayingWireFrameProtocol? { get set }
    
    func viewDidLoadViper()
}

protocol NowPlayingInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorCallBack(withData: MovieQueryResponse<Movie>) 
}

protocol NowPlayingInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: NowPlayingInteractorOutputProtocol? { get set }
    var localDatamanager: NowPlayingLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: NowPlayingRemoteDataManagerInputProtocol? { get set }
    
    func getRemoteData()
}

protocol NowPlayingDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol NowPlayingRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: NowPlayingRemoteDataManagerOutputProtocol? { get set }
    func getNowPlayingData()

}

protocol NowPlayingRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackData(with data: MovieQueryResponse<Movie>)
}

protocol NowPlayingLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
