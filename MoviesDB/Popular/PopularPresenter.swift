//
//  PopularPresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class PopularPresenter  {
    
    // MARK: Properties
    weak var view: PopularViewProtocol?
    var interactor: PopularInteractorInputProtocol?
    var wireFrame: PopularWireFrameProtocol?
    
}

extension PopularPresenter: PopularPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getRemoteData()
    }
}

extension PopularPresenter: PopularInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interactorCallBack(with data: MovieQueryResponse<Movie>) {
        view?.presenterCallBackToView(with: data)
    }
}
