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
}

protocol UpcomingWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createUpcomingModule() -> UIViewController
}

protocol UpcomingPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: UpcomingViewProtocol? { get set }
    var interactor: UpcomingInteractorInputProtocol? { get set }
    var wireFrame: UpcomingWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol UpcomingInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol UpcomingInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: UpcomingInteractorOutputProtocol? { get set }
    var localDatamanager: UpcomingLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UpcomingRemoteDataManagerInputProtocol? { get set }
}

protocol UpcomingDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol UpcomingRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: UpcomingRemoteDataManagerOutputProtocol? { get set }
}

protocol UpcomingRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol UpcomingLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
