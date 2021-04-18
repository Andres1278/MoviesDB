//
//  PopularRemoteDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import Alamofire

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
    
    func getNextPage(from page: Int) {
        let nextPage = String(page + 1)
        var parameters = API.defaultRequestParameters
        parameters["page"] = nextPage
        ServiceManger.request(to: API.url(for: .popular), parameters: parameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackData(with: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
