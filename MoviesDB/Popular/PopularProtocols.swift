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
}

protocol PopularWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createPopularModule() -> UIViewController
}

protocol PopularPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: PopularViewProtocol? { get set }
    var interactor: PopularInteractorInputProtocol? { get set }
    var wireFrame: PopularWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol PopularInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol PopularInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PopularInteractorOutputProtocol? { get set }
    var localDatamanager: PopularLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PopularRemoteDataManagerInputProtocol? { get set }
}

protocol PopularDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PopularRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PopularRemoteDataManagerOutputProtocol? { get set }
}

protocol PopularRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol PopularLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
