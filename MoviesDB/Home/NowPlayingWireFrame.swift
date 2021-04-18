//
//  HomeWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

class NowPlayingWireFrame: NowPlayingWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "NowPlayingView", bundle: Bundle.main)
    }
    
    class func createHomeModule() -> UIViewController {
        
        guard let nowPlayingView = mainStoryboard.instantiateViewController(withIdentifier: "NowPlayingView") as? NowPlayingController else {
            return UIViewController()
        }
        nowPlayingView.tabBarItem.title = "Now Playing"
        let presenter: NowPlayingPresenterProtocol & NowPlayingInteractorOutputProtocol = NowPlayingPresenter()
        let interactor: NowPlayingInteractorInputProtocol & NowPlayingRemoteDataManagerOutputProtocol = NowPlayingInteractor()
        let localDataManager: NowPlayingLocalDataManagerInputProtocol = NowPlayingDataManager()
        let remoteDataManager: NowPlayingRemoteDataManagerInputProtocol = NowPlayingRemoteDataManager()
        let wireFrame: NowPlayingWireFrameProtocol = NowPlayingWireFrame()
        
        nowPlayingView.presenter = presenter
        presenter.view = nowPlayingView
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        return nowPlayingView
    }
    
    
    
    
    func presentDetailView(from view: UIViewController, with movie: Movie) {
        
    }
    
}

