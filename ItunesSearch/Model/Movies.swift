//
//  Movies.swift
//  ItunesSearch
//
//  Created by Erica Sumague on 1/12/21.
//  Copyright © 2021 Erica Sumague. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let count:Int
    let allMovies:[Movie]
    
    enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case allMovies = "results"
    }
}
