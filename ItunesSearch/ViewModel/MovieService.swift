//
//  MovieService.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/17/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MovieService {
    var data = [NSManagedObject]()
    
    let appDelegate: AppDelegate = {
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        return applicationDelegate
    }()

    let container:NSPersistentContainer = {
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = applicationDelegate.persistentContainer
        return persistentContainer
    }()
    
    func fetchMovies() -> [NSManagedObject] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sort = NSSortDescriptor(key: "trackName", ascending: true)
        request.sortDescriptors = [sort]
        
        request.fetchBatchSize = 20
        
        do {
            // fetch on the NSManagedObjectContext
            data = try container.viewContext.fetch(request)
        } catch {
            print("Fetch failed")
        }
        
        return data
    }
}
