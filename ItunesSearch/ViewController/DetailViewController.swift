//
//  DetailViewController.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/12/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    @IBOutlet weak var movieDescription: UITextView!
    func configureView() {
        // Update the user interface for the detail item.
        if let movie = movieItem {
            if let title = titleLabel {
                title.text = movie.trackName
            }
            
            if let movieDescription = movieDescriptionLabel {
                movieDescription.text = movie.movieDescription
            }
            
            if let artwork = artworkImageView {
                artwork.sd_setImage(with: URL(string: movie.artwork ?? ""), placeholderImage: UIImage(named: "place holder.png"))
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var movieItem: Movie? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

