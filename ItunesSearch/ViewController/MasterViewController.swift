//
//  MasterViewController.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/12/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var movieList = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        requestAndLoadMovies()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    private func requestAndLoadMovies() {
        loading.startAnimating()
        
        //request api
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let apiService = NetworkService(url: "https://itunes.apple.com/search?term=star&country=au&media=movie")
            apiService.fetchMovies { (result) in
                if (result == "success") {
                    self.loadMoviesFromCoreData()
                    self.tableView .reloadData()
                    self.loading.stopAnimating()
                }
            }
        }
    }
    
    func loadMoviesFromCoreData() {
        let movieService = MovieService()
        movieList = movieService.fetchMovies()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = movieList[indexPath.row] as! Movie
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.movieItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        let movie = movieList[indexPath.row] as! Movie
        cell.setMovieDetails(data: movie)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }

}

