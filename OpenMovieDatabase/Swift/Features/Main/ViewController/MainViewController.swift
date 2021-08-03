//
//  MainViewController.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/2/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainViewSearchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        mainTableView.registerNibCell(CustomTableViewCell.self)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainViewSearchBar.backgroundImage = UIImage()
    }
}

// MARK: - Table view data source

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Will be implemented later
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(indexPath, type: CustomTableViewCell.self)
        return cell
    }
}
