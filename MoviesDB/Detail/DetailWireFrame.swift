//
//  DetailWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    

    class func createDetailModule(with movie: Movie) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = viewController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.movie = movie
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
