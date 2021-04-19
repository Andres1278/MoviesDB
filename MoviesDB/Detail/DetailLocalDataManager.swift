//
//  DetailLocalDataManager.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import RealmSwift
import UIKit

class DetailLocalDataManager:DetailLocalDataManagerInputProtocol {
    
    lazy var realm:Realm = {
        return try! Realm()
    }()
    var localRequestHandler: DetailLocalDataManagerOutputProtocol?
    
    func saveLocalMovieInfo(with movie: LocalInfoMovie) {
        save(with: movie)
        getInfo(with: movie.id)
    }
    
    func save(with movie: LocalInfoMovie) {
        let movieToSave = LocalInfoMovie()
        movieToSave.favorite = movie.favorite
        movieToSave.id = movie.id
        movieToSave.raitingPersonal = movie.raitingPersonal
        print("---Save Local Movie Info: \(movieToSave)------")
        try! realm.write {
            realm.add(movie, update: .modified)
        }
    }
    
    func getInfo(with id: Int) {
        let movies = realm.objects(LocalInfoMovie.self).filter("id = %@", id)
        for movie in movies {
            if id == movie.id {
                print("---- MOVIE GET ----- \(movie)")
            }
        }
        
    }

    
}

class LocalInfoMovie: Object {
    @objc dynamic var favorite: Bool = false
    @objc dynamic var id: Int = -1
    @objc dynamic var raitingPersonal: Double = 0
    
    override static func primaryKey() -> String? {
            return "id"
        }
}
