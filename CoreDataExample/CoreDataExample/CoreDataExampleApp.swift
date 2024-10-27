//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Nivedha Rajendran on 27.10.24.
//

import SwiftUI
import CoreData

@main
struct CoreDataExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environment(\.managedObjectContext, CoreDataHelper.shared.persistentContainer.viewContext)
        }
    }
}
