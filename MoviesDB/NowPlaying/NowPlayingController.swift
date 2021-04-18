//
//  NowPlayingController.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 16/04/21.
//  
//

import Foundation
import UIKit

class NowPlayingController: UIViewController {

    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // MARK: Properties
    var presenter: NowPlayingPresenterProtocol?
    var response: MovieQueryResponse<Movie>?
    var moviesToShow = [Movie]()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating() 
        collectioView.delegate = self
        collectioView.dataSource = self
        presenter?.viewDidLoadViper()
        collectioView.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
}

extension NowPlayingController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        cell.configure(with: moviesToShow[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension NowPlayingController: NowPlayingViewProtocol {
    
   
    
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        moviesToShow = data.results
        print("----- View ----- \n \(response)")
        DispatchQueue.main.async {
            self.collectioView.reloadData()
        }
        
    }
    
    func starAndShowSpinner() {
        self.spinner.startAnimating()
    }
    
    func stopAndHideSpinner() {
        self.spinner.stopAnimating()
        self.spinner.hidesWhenStopped = true
    }
    
    // TODO: implement view output methods
}