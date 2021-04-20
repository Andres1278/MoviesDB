//
//  UpcomingRemoteDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation

class UpcomingRemoteDataManager:UpcomingRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: UpcomingRemoteDataManagerOutputProtocol?
    
    func getUpcomingData() {
        ServiceManger.request(to: API.url(for: .upcoming), parameters: API.defaultRequestParameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackToInteractor(with: response)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func getNextPage(from page: Int) {
        let nextPage = String(page + 1)
        var parameters = API.defaultRequestParameters
        parameters[API.pageParameterKey] = nextPage
        ServiceManger.request(to: API.url(for: .upcoming), parameters: parameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackToInteractor(with: response)
            case .failure(let error):
                print(error)
            }
        }

    }
}