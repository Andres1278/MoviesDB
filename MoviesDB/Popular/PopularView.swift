//
//  PopularView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class PopularView: UIViewController {

    // MARK: Properties
    var presenter: PopularPresenterProtocol?
    var response: MovieQueryResponse<Movie>?
    var moviesToShow = [Movie]()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PopularView: PopularViewProtocol {
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        moviesToShow = data.results
        print("----- POPULAR View ----- \n \(response)")
        
    }
    
    // TODO: implement view output methods
}
