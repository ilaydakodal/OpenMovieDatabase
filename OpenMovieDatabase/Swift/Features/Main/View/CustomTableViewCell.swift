//
//  CustomTableViewCell.swift
//  OpenMovieDatabase
//
//  Created by Ilayda Kodal on 8/3/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customCellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCellImageView.applyDefaultStyling()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fill(presentation: MoviePresentetion) {
        nameLabel.text = presentation.nameLabelText
        dateLabel.text = presentation.dateLabelText
        imdbLabel.text = presentation.imdbRankText
        genreLabel.text = presentation.genreText
    }
    
    func configureImage(with model: MovieResponse) {
        let url = model.poster
        let data = try! Data(contentsOf: URL(string: url)!)
        self.customCellImageView.image = UIImage(data: data)
    }
}
