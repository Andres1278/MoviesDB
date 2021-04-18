//
//  TopRatedPresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class TopRatedPresenter  {
    
    // MARK: Properties
    weak var view: TopRatedViewProtocol?
    var interactor: TopRatedInteractorInputProtocol?
    var wireFrame: TopRatedWireFrameProtocol?
    
}

extension TopRatedPresenter: TopRatedPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension TopRatedPresenter: TopRatedInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
