//
//  HomeRemoteDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation

class NowPlayingRemoteDataManager:NowPlayingRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: NowPlayingRemoteDataManagerOutputProtocol?
    
    func getNowPlayingData() {
        ServiceManger.request(to: API.url(for: .nowPlaying), parameters: API.defaultRequestParameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
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
        parameters[API.pageParameterKey] = nextPage
        ServiceManger.request(to: API.url(for: .nowPlaying), parameters: parameters, headers: API.defaultRequestHeaders) { (result:ServiceManger.CompletionResult<MovieQueryResponse<Movie>>) in
            switch result {
            case .success(let response):
                self.remoteRequestHandler?.callBackData(with: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}