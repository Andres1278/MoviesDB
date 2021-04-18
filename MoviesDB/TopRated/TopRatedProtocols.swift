//
//  TopRatedProtocols.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

protocol TopRatedViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: TopRatedPresenterProtocol? { get set }
}

protocol TopRatedWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createTopRatedModule() -> UIViewController
}

protocol TopRatedPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: TopRatedViewProtocol? { get set }
    var interactor: TopRatedInteractorInputProtocol? { get set }
    var wireFrame: TopRatedWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol TopRatedInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol TopRatedInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: TopRatedInteractorOutputProtocol? { get set }
    var localDatamanager: TopRatedLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: TopRatedRemoteDataManagerInputProtocol? { get set }
}

protocol TopRatedDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol TopRatedRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: TopRatedRemoteDataManagerOutputProtocol? { get set }
}

protocol TopRatedRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol TopRatedLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
