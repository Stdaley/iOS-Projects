 //
//  Users+CoreDataProperties.swift
//  Final2
//
//  Created by Minyen chiang on 4/30/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var userName: String?
    @NSManaged public var passWord: String?

}
