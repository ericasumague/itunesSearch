//
//  Movie+CoreDataProperties.swift
//  
//
//  Created by Erica Sumague on 1/16/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var thumbnail: String?
    @NSManaged public var currency: String?
    @NSManaged public var genre: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var price: Double
    @NSManaged public var trackId: Int64
    @NSManaged public var trackName: String?
    @NSManaged public var artwork: String?

}
