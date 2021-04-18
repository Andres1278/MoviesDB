//
//  UpcomingWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class UpcomingWireFrame: UpcomingWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Upcoming", bundle: Bundle.main)
    }

    class func createUpcomingModule() -> UIViewController {
        guard let upcomingView = mainStoryboard.instantiateViewController(withIdentifier: "UpcomingView") as? UpcomingView else {
            return UIViewController()
        }
        upcomingView.tabBarItem.title = "Upcoming"
            let presenter: UpcomingPresenterProtocol & UpcomingInteractorOutputProtocol = UpcomingPresenter()
            let interactor: UpcomingInteractorInputProtocol & UpcomingRemoteDataManagerOutputProtocol = UpcomingInteractor()
            let localDataManager: UpcomingLocalDataManagerInputProtocol = UpcomingLocalDataManager()
            let remoteDataManager: UpcomingRemoteDataManagerInputProtocol = UpcomingRemoteDataManager()
            let wireFrame: UpcomingWireFrameProtocol = UpcomingWireFrame()
            
            upcomingView.presenter = presenter
            presenter.view = upcomingView
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return upcomingView
        
    }
    
    
    
}
