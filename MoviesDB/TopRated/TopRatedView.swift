//
//  TopRatedView.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//  
//

import Foundation
import UIKit

class TopRatedView: UIViewController {

    // MARK: Properties
    var presenter: TopRatedPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TopRatedView: TopRatedViewProtocol {
    // TODO: implement view output methods
}
