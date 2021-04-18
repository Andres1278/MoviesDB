//
//  DetailRemoteDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    
    func getMovieDetailData(with id: Int) {
        
        let url = "\(API.url(for: .movieDetail))/\(id)"
//        var parameters = API.defaultRequestParameters
//        parameters["movie_id"] = "\(id)"
        ServiceManger.request(to: url, parameters: API.defaultRequestParameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieDetail>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackDataToInteractor(with: response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
