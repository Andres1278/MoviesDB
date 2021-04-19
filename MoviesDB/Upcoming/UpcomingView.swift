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
    let numberOfColumns: CGFloat = 2
    var isLoadingPage: Bool = false
    var isSearching: Bool = false
    var filtered: [Movie] = []
    var totalPages: Int?
    var page: Int?
    var totalResults: Int?
    var currentFilter: String?
    var shouldLoadNextPage: Bool {
        !isLoadingPage && !isSearching
    }
    @IBOutlet weak var searchBar: UISearchBar!
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
//        presenter?.loadNextPage(from: currentPage)
    }
}

extension UpcomingView: UpcomingViewProtocol {
    // TODO: implement view output methods
    func presenterCallBackToView(with data: MovieQueryResponse<Movie>) {
        response = data
        isLoadingPage = false
        moviesToShow.append(contentsOf: data.results)
        applyFilter(with: self.currentFilter ?? "")
        totalPages = data.total_pages
        totalResults = data.total_results
        page = data.page
        print("------UPCOMIG VIEW------ \n \(moviesToShow)")
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

extension UpcomingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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

extension UpcomingView: UISearchBarDelegate {
    
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
