//
//  UpcomingPresenter.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class UpcomingPresenter  {
    
    // MARK: Properties
    weak var view: UpcomingViewProtocol?
    var interactor: UpcomingInteractorInputProtocol?
    var wireFrame: UpcomingWireFrameProtocol?
    
}

extension UpcomingPresenter: UpcomingPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension UpcomingPresenter: UpcomingInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
