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
    var totalPages: Int?
    var totalResults: Int?
    let numberOfColumns: CGFloat = 2
    var currentFilter: String?
    var page: Int?
    var isLoadingPage: Bool = false
    var isSearching: Bool = false
    //Search
    @IBOutlet weak var searchBar: UISearchBar!
    var filtered: [Movie] = []
    var shouldLoadNextPage: Bool {
        !isLoadingPage && !isSearching
    }
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating() 
        collectioView.delegate = self
        collectioView.dataSource = self
        presenter?.viewDidLoadViper()
        collectioView.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    func loadNextPage() {
        guard let currentPage = page, shouldLoadNextPage else {
            return
        }
        isLoadingPage = true
//        presenter?.loadNextPage(from: currentPage)
    }
}

extension NowPlayingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
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

extension NowPlayingController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        applyFilter(with: text)
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
            collectioView.reloadData()
            return
        }
        filtered = moviesToShow.filter {
            guard $0.title!.lowercased().contains(text.lowercased()) else { return false }
            return true
        }
        collectioView.reloadData()
    }
}

extension NowPlayingController: NowPlayingViewProtocol {
    
   
    
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        isLoadingPage = false
        response = data
        moviesToShow.append(contentsOf: data.results)
        applyFilter(with: self.currentFilter ?? "")
        totalPages = data.total_pages
        totalResults = data.total_results
        page = data.page
        print("-----NOW PLAYING View ----- \n \(response)")
        collectioView.reloadData()
        
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
