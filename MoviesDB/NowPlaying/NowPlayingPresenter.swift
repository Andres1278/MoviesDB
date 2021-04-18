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
    
    
    func showDetailView(with Movie: Movie) {
        wireFrame?.presentDetailView(from: self.view!, with: Movie)
    }
    
}

extension NowPlayingPresenter: NowPlayingInteractorOutputProtocol {
    func interactorCallBack(with data: MovieQueryResponse<Movie>) {
        view?.presenterCallBackToView(with: data)
        view?.stopAndHideSpinner()
    }
    
    
    
   
    
    // TODO: implement interactor output methods
}
