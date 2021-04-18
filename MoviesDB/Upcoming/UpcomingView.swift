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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UpcomingView: UpcomingViewProtocol {
    // TODO: implement view output methods
}
