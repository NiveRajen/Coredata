//
//  CoreDataHelper.swift
//  CoreDataExample
//
//  Created by Nivedha Rajendran on 27.10.24.
//


import Foundation
import CoreData

final class CoreDataHelper {
    static let shared = CoreDataHelper()
    private init() { }
    
    //Use NSPersistentContainer to manage the Core Data stack, including the SQLite store.
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CoreDataModel")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            
            container.viewContext.automaticallyMergesChangesFromParent = true
            return container
        }()

        // Core Data saving support
        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}
