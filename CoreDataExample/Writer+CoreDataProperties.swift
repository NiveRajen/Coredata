//
//  Writer+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Nivedha Rajendran on 27.10.24.
//
//

import Foundation
import CoreData


extension Writer {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Writer> {
        return NSFetchRequest<Writer>(entityName: "Writer")
    }
    
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var book: Set<Book>?
    
    public var wrappedFirstName: String {
        firstName ?? ""
    }
    
    public var wrappedLastName: String {
        lastName ?? ""
    }
    
    public var wrappedBooks: [Book] {
        let books = book ?? []
        return books.sorted { $0.wrappedName < $1.wrappedName }
    }
}

// MARK: Generated accessors for book
extension Writer {

    @objc(addBookObject:)
    @NSManaged public func addToBook(_ value: Book)

    @objc(removeBookObject:)
    @NSManaged public func removeFromBook(_ value: Book)

    @objc(addBook:)
    @NSManaged public func addToBook(_ values: NSSet)

    @objc(removeBook:)
    @NSManaged public func removeFromBook(_ values: NSSet)

}

extension Writer : Identifiable {

}
