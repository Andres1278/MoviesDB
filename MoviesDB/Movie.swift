//
//  Movie.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//

import Foundation


struct Movie: Codable {

    var id: Int
    var title: String?
    var overview: String?
    var poster: String?
    var original_language: String?
    var voteAverage: Double?

    init(id: Int, title: String, overview: String, poster: String, voteAverage: Decimal) {
        self.id = id
        self.title = title
        self.overview = overview
        self.poster = poster
    }

    func posterUrl() -> URL? {
        return URL(string: "\(API.imagesBaseURL)\(poster ?? "")")
    }

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case poster = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct MovieDetail: Codable {
    let budget: Int?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let release_date: String?
    let revenue: Int?
    let status: String?
    let tagline: String?
    let vote_average: Double?
    let production_countries: [Production]?
    let genres: [Gender]?
    let original_language: String?
    let poster_path: String?
    
    func posterUrl() -> URL? {
        return URL(string: "\(API.imagesBaseURL)\(poster_path ?? "")")
    }
}

struct Gender: Codable {
    let name: String?
}

struct Production: Codable {
    let name: String?
}

struct MovieQueryResponse<T: Codable> : Codable {
    let page: Int
    let results: [T]
    let total_pages: Int
    let total_results: Int
}



