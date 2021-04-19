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
    var isLoadingPage: Bool = false
    var isSearching: Bool = false
    // Search
    @IBOutlet weak var searchBar: UISearchBar!
    var filtered: [Movie] = []
    let numberOfColumns: CGFloat = 2
    var shouldLoadNextPage: Bool {
        !isLoadingPage && !isSearching
    }
    
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
        guard let currentPage = page, shouldLoadNextPage else {
            return
        }
        isLoadingPage = true
        presenter?.loadNextPage(from: currentPage)
    }
}

extension PopularView: PopularViewProtocol {
    
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        isLoadingPage = false
        moviesToShow.append(contentsOf: data.results)
        applyFilter(with: self.currentFilter ?? "")
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

extension PopularView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        if indexPath.row == filtered.count - 1 {
           loadNextPage()
        }
        cell.configure(with: filtered[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showDetailView(with: filtered[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = ((screenSize.width - (10 * (numberOfColumns - 1) ) - 30) / numberOfColumns) - 1
        return CGSize(width: cellWidth, height: 1.6 * cellWidth.rounded())
    }
    
}

extension PopularView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                searchBar.resignFirstResponder()
            }
        }
        applyFilter(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func applyFilter(with text: String) {
        isSearching = true
        currentFilter = text
        guard text != "" else {
            isSearching = false
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
    
}
