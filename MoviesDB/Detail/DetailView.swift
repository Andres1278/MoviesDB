//
//  DetailView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    @IBOutlet weak var label: UILabel!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    func showMovieDetail(with movie: Movie) {
        label.text = movie.title
    }
    
    // TODO: implement view output methods
}
