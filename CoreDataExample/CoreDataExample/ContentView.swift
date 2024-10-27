//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Nivedha Rajendran on 27.10.24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Writer.firstName, ascending: true)],
        animation: .default) private var writers: FetchedResults<Writer>
    
    var body: some View {
        VStack {
            List {
                ForEach(writers) { writer in
                    Section("\(writer.wrappedFirstName) \(writer.wrappedLastName)") {
                        ForEach(writer.wrappedBooks) { book in
                            HStack(spacing: 10) {
                                Text(book.wrappedName)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
            
            Button ("Add Book"){
                // Create a new entity object
                
                
                let writerEntity = Writer(context: managedObjectContext)
                writerEntity.firstName = "William"
                writerEntity.lastName = "Shakespeare"
                
                let book = Book(context: managedObjectContext)
                book.name = "Romeo and Juliet"
                
                writerEntity.addToBook(book)
                // Save the context
                do {
                    try managedObjectContext.save()
                    print("Data saved successfully!")
                    
                } catch {
                    print("Failed to save data: \(error.localizedDescription)")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
