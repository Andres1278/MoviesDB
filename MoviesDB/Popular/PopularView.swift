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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PopularView: PopularViewProtocol {
    // TODO: implement view output methods
}
