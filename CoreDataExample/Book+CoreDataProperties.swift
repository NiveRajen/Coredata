//
//  Book+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Nivedha Rajendran on 27.10.24.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var name: String?
    @NSManaged public var writer: Writer?

    public var wrappedName: String {
        name ?? ""
    }
    
    
}

extension Book : Identifiable {

}
