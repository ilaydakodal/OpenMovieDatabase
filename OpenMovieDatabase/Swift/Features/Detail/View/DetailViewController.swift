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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fill(presentation: MoviePresentetion) {
        //customCellImageView.image = presentation.posterImage
        detailNameLabel.text = presentation.nameLabelText
        deatilDateLabel.text = presentation.dateLabelText
        detailLabel.text = presentation.detailText
    }
}
