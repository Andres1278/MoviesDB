//
//  UpcomingView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class UpcomingView: UIViewController {

    // MARK: Properties
    var presenter: UpcomingPresenterProtocol?
    var response: MovieQueryResponse<Movie>?
    var moviesToShow = [Movie]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension UpcomingView: UpcomingViewProtocol {
    // TODO: implement view output methods
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        moviesToShow = data.results
        print("------UPCOMIG VIEW------ \n \(moviesToShow)")
    }
    
}
