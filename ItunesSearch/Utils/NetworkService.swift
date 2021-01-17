//
//  NetworkService.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/12/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

class NetworkService {
    fileprivate var url = ""

    let appDelegate: AppDelegate = {
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        return applicationDelegate
    }()
    
    let container:NSPersistentContainer = {
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = applicationDelegate.persistentContainer
        return persistentContainer
    }()
    
    init (url: String) {
        self.url = url
    }
    
    //MARK:- fetchMovies
    // API Function to fetch the movies, if success save to core data
    func fetchMovies(completion: @escaping (String)->()){
        AF.request(self.url).response { (responseData) in
            guard let data = responseData.data else { return }

            do {
                let decoder = JSONDecoder()
                
                // Assign the NSManagedObject Context to the decoder
                decoder.userInfo[CodingUserInfoKey.context!] = self.container.viewContext
                
                let movies = try decoder.decode(Movies.self, from: data)
                print("movies \(movies.allMovies.count)")
                
                // Save the decoded objects to Core Data
                self.appDelegate.saveContext()
                
                //Inform the service
                completion("success")
            } catch {
                print("Error on Decoding \(error)")
                
                completion("error")
            }
        }
    }
        
}
