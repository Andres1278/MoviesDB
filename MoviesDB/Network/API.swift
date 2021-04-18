//
//  API.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//

import Foundation
import Alamofire

struct API {
    
    static let defaultRequestParameters = ["api_key": "4d58b851c31392bbf03cdf8fed99247c"]
    static let defaultRequestHeaders: HTTPHeaders = ["Content-type": "application/json; charset=utf-8"]
    static let baseURL = "https://api.themoviedb.org/3"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let queryParameterKey = "query"
    static let pageParameterKey = "page"
    
    enum Endpoint: String {
        case search = "/search/movie"
        case nowPlaying = "/movie/now_playing"
        case popular = "/movie/popular"
        case topRated = "/movie/top_rated"
        case upcoming = "/movie/upcoming"
    }
    
    static func url(for endpoint: Endpoint) -> String {
        return baseURL + endpoint.rawValue
    }
}




