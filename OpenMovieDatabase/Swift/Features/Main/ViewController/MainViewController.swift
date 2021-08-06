//
//  MainViewController.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/2/21.
//

import UIKit

class MainViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    private var listPresentation: [MoviePresentetion] = []
    private var detailPresentation: MoviePresentetion?
    private lazy var cell = CustomTableViewCell()
    fileprivate var searchText: String?
    let searchController = UISearchController()
    var movies = [MovieResponse]()
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        configureView()
    }

    func configureView() {
        title = "OMDB"
        mainTableView.registerNibCell(CustomTableViewCell.self)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let movie = searchController.searchBar.text {
            guard movie.count > 2 else {return}
            self.searchText = movie
            searchController.searchBar.isLoading = true
            //showSpinner()
            viewModel.fetchMovie(movie: movie)
            DispatchQueue.main.async {
                searchController.searchBar.isLoading = false
                //self.stopSpinner()
                print(movie)
            }
        }
        if NetworkMonitor.shared.isConnected == false {
            presentWarningAlert("No internet Connection")
        }
    }
}

extension MainViewController {
    
    func bindViewModel() {
        viewModel = MainViewModel()
        viewModel.changeHandler = { [weak self] change in
            DispatchQueue.main.async {
                self?.applyChange(change)
            }
        }
    }
    
    func applyChange(_ change: MainViewModel.Change) {
        switch change {
        case .presentation(let presentation):
            listPresentation = presentation.listPresentation
            detailPresentation = presentation.detailPresentation
            if let image = URL.urlForMovieApi(movie: presentation.detailPresentation.posterImage) {
                self.cell.customCellImageView?.load(url: image)
                self.cell.customCellImageView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
                self.cell.customCellImageView?.layer.cornerRadius = 10
            }
            mainTableView.reloadData()
        case .alert(let message):
            print(message)
        }
    }
}

// MARK: - Table view data source

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listPresentation.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        self.present(detail, animated: true, completion: nil)
        detail.fill(presentation: detailPresentation!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(indexPath, type: CustomTableViewCell.self)
        cell.fill(presentation: listPresentation[indexPath.row])
        return cell
    }
}
