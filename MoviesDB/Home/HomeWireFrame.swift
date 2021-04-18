//
//  HomeWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    class func createHomeModule() -> UIViewController {
        guard let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController else {
            return UIViewController()
        }
        var viewControllers: [UIViewController] = []
        
        if let nowPlayingView = mainStoryboard.instantiateViewController(withIdentifier: "NowPlayingView") as? HomeViewController {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            nowPlayingView.presenter = presenter
            presenter.view = nowPlayingView
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            viewControllers.append(nowPlayingView)
        }
        tabBarController.setViewControllers(viewControllers, animated: true)
        return tabBarController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    
    func presentDetailView(from view: UIViewController, with movie: Movie) {
        
    }
    
}
