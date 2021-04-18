//
//  HomePresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

class NowPlayingPresenter  {
    
    // MARK: Properties
    weak var view: NowPlayingViewProtocol?
    var interactor: NowPlayingInteractorInputProtocol?
    var wireFrame: NowPlayingWireFrameProtocol?
    
}

extension NowPlayingPresenter: NowPlayingPresenterProtocol {
  
    // TODO: implement presenter methods
    func viewDidLoadViper() {
        interactor?.getRemoteData()
        view?.starAndShowSpinner()
    }
    
    
    func showDetailView(with movie: Movie) {
        wireFrame?.presentDetailView(from: view!, with: movie)
    }
    
}

extension NowPlayingPresenter: NowPlayingInteractorOutputProtocol {
    func interactorCallBack(withData: MovieQueryResponse<Movie>) {
        view?.presenterCallBackToView(with: withData)
        view?.stopAndHideSpinner()
    }
    
    
    
   
    
    // TODO: implement interactor output methods
}
