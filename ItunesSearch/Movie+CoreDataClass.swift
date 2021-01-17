//
//  Movie+CoreDataClass.swift
//  
//
//  Created by Erica Sumague on 1/16/21.
//
//

import Foundation
import CoreData

@objc(Movie)
public class Movie: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        do {
            try container.encode(trackId, forKey: .trackId)
            try container.encode(trackName, forKey: .trackName)
            try container.encode(artwork, forKey: .artwork)
            try container.encode(price, forKey: .price)
            try container.encode(currency, forKey: .currency)
            try container.encode(genre, forKey: .genre)
            try container.encode(movieDescription, forKey: .movieDescription)
            try container.encode(thumbnail, forKey: .thumbnail)
            
        } catch {
            print("error on encode")
        }
    }
        
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjectContext)
        else {
            fatalError("error on decoding ")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            trackId = try values.decode(Int64.self, forKey: .trackId)
            trackName = try values.decode(String.self, forKey: .trackName)
            artwork = try values.decode(String.self, forKey: .artwork)
            price = try values.decode(Double.self, forKey: .price)
            currency = try values.decode(String.self, forKey: .currency)
            genre = try values.decode(String.self, forKey: .genre)
            movieDescription = try values.decode(String.self, forKey: .movieDescription)
            thumbnail = try values.decode(String.self, forKey: .thumbnail)
        } catch {
            print("error \(error)")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case trackId
        case trackName
        case artwork = "artworkUrl100"
        case price = "trackPrice"
        case currency
        case genre = "primaryGenreName"
        case movieDescription = "longDescription"
        case thumbnail = "artworkUrl60"
    }

}
