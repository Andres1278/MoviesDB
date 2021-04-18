//
//  TopRatedWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class TopRatedWireFrame: TopRatedWireFrameProtocol {

    class func createTopRatedModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "TopRatedView")
        if let view = navController.children.first as? TopRatedView {
            let presenter: TopRatedPresenterProtocol & TopRatedInteractorOutputProtocol = TopRatedPresenter()
            let interactor: TopRatedInteractorInputProtocol & TopRatedRemoteDataManagerOutputProtocol = TopRatedInteractor()
            let localDataManager: TopRatedLocalDataManagerInputProtocol = TopRatedLocalDataManager()
            let remoteDataManager: TopRatedRemoteDataManagerInputProtocol = TopRatedRemoteDataManager()
            let wireFrame: TopRatedWireFrameProtocol = TopRatedWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "TopRatedView", bundle: Bundle.main)
    }
    
}
