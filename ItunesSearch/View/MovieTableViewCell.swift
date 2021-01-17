//
//  MovieTableViewCell.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/14/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMovieDetails(data: Movie) {
        titleLabel.text = data.trackName ?? "title"
        genreLabel.text = data.genre ?? ""
        priceLabel.text = data.currency! + "\(data.price)"
        thumbnailImageView.sd_setImage(with: URL(string: data.thumbnail ?? ""), placeholderImage: UIImage(named: "place holder.png"))
    }

}
