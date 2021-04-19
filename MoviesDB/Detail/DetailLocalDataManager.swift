//
//  DetailLocalDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class DetailLocalDataManager:DetailLocalDataManagerInputProtocol {
    
    var localRequestHandler: DetailLocalDataManagerOutputProtocol?
    
    func saveFavorite(with value: Bool) {
        print("---Is favorite: \(value)------")
//        SAVE with REALM
    }
    
    func getFavoriteState(with value: Bool) {
        localRequestHandler?.getFavoriteState(with: true)
    }
    
}
