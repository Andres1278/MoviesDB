//
//  PopularWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class PopularWireFrame: PopularWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "PopularView", bundle: Bundle.main)
    }

    class func createPopularModule() -> UIViewController {
        guard let popularView = mainStoryboard.instantiateViewController(withIdentifier: "PopularView") as? PopularView else {
            return UIViewController()
        }
        popularView.tabBarItem.title = "Populars"
        popularView.tabBarItem.image = UIImage(systemName: "person.3.fill")
            let presenter: PopularPresenterProtocol & PopularInteractorOutputProtocol = PopularPresenter()
            let interactor: PopularInteractorInputProtocol & PopularRemoteDataManagerOutputProtocol = PopularInteractor()
            let localDataManager: PopularLocalDataManagerInputProtocol = PopularLocalDataManager()
            let remoteDataManager: PopularRemoteDataManagerInputProtocol = PopularRemoteDataManager()
            let wireFrame: PopularWireFrameProtocol = PopularWireFrame()
            
            popularView.presenter = presenter
            presenter.view = popularView
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return popularView
        
    }
    
    func presentDetailView(from view: PopularViewProtocol, with movie: Movie) {
        let newDetail = DetailWireFrame.createDetailModule(with: movie)
        if let vc = view as? UIViewController {
            vc.present(newDetail, animated: true, completion: nil)
        }
    }
    
    
}
