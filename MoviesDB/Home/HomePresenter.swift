//
//  HomePresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
  
    // TODO: implement presenter methods
    func viewDidLoadViper() {
        interactor?.getRemoteData()
        view?.starAndShowSpinner()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorCallBack(withData: MovieQueryResponse<Movie>) {
        view?.presenterCallBackToView(with: withData)
        view?.stopAndHideSpinner()
    }
    
    
    
   
    
    // TODO: implement interactor output methods
}
