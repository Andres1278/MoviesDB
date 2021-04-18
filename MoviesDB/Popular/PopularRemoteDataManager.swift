//
//  PopularRemoteDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class PopularRemoteDataManager:PopularRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: PopularRemoteDataManagerOutputProtocol?
    
    func getPopularData() {
        ServiceManger.request(to: API.url(for: .popular), parameters: API.defaultRequestParameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackData(with: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
