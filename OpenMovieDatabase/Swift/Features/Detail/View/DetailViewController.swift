//
//  DetailViewController.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var deatilDateLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailGenreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.layer.cornerRadius = 10
        detailImageView.applyDefaultStyling()
    }
    
    func fill(presentation: MoviePresentetion) {
        detailGenreLabel.text = presentation.genreText
        detailNameLabel.text = presentation.nameLabelText
        deatilDateLabel.text = presentation.dateLabelText
        detailLabel.text =  " " +  presentation.detailText
    }
    
    func configureImage(with model: MovieResponse) {
        let url = model.poster
        let data = try! Data(contentsOf: URL(string: url)!)
        self.detailImageView.image = UIImage(data: data)
    }
}
