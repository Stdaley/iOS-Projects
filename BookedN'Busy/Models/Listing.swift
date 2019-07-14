//
//  Listing.swift
//  cis454Project
//
//  Created by mira jacobs on 5/2/19.
//  Copyright © 2019 Shania Daley. All rights reserved.
//


import Foundation
import Firebase

// Listing class creates a Listing object that holds all values needed when a listing is created
// This class is used to read and write to the database
class Listing {
    
    var postedBy: String!
    var number: String!
    var listID: String!
    var service: String!
    var bio: String!
    var availability: String!

    // Listing class constructor
    init (postedBy:String?, number:String?, listID: String?, bio:String?, service: String?, availability:String? ) {
        self.postedBy = postedBy
        self.number = number
        self.listID = listID
        self.bio = bio
        self.service = service;
        self.availability = availability
        
    }
    
} // End of Listing class
