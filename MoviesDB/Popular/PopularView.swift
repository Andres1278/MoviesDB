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
    var moviesToShow: [Movie] = []
    var totalPages: Int?
    var totalResults: Int?
    var currentFilter: String?
    var page: Int?
    
    // Search
    var filtered: [Movie] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    func loadNextPage() {
        guard let actualPage = page else {
            return
        }
        presenter?.loadNextPage(from: actualPage)
    }
}

extension PopularView: PopularViewProtocol {
    
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        moviesToShow.append(contentsOf: data.results)
        self.applyFilter(with: self.currentFilter ?? "")
        totalPages = data.total_pages
        totalResults = data.total_results
        page = data.page
        print("----- POPULAR View ----- [PAV] \(moviesToShow.count)")
        collectionView.reloadData()
    }
    
    func starAndShowSpinner() {
        self.spinner.startAnimating()
    }
    
    func stopAndHideSpinner() {
        self.spinner.stopAnimating()
        self.spinner.hidesWhenStopped = true
    }
}

extension PopularView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        if indexPath.row == moviesToShow.count - 1 {
           loadNextPage()
        }
        cell.configure(with: moviesToShow[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showDetailView(with: moviesToShow[indexPath.row])
    }
    
}

extension PopularView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        applyFilter(with: text)
    }
    
    func applyFilter(with text: String) {
        currentFilter = text
        guard text != "" else {
            filtered = moviesToShow
            collectionView.reloadData()
            return
        }
        filtered = moviesToShow.filter {
            guard $0.title!.lowercased().contains(text.lowercased()) else { return false }
            return true
        }
        collectionView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        applyFilter(with: text)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
}
