# Coredata


Relationship


Constraints - ?
Unique Constraints to entities:
Steps - Select the Entity, Click on the "+" button under Unique Constraints, add the name of the unique constraint.
To verify:

```swift
do {
    try context.save()
} catch let error as NSError {
    if let detailedError = error.userInfo[NSDetailedErrorsKey] as? [NSError] {
        for detailed in detailedError {
            if detailed.code == NSManagedObjectValidationError {
                print("Unique constraint violated: \(detailed.userInfo)")
            }
        }
    } else {
        print("Could not save: \(error), \(error.userInfo)")
    }
}
```


Parent Entity for Entity?

Modules under class in entity - ?

Properties - Transient, Optional - ?

Inverse Relationship - ?

Delete Rule in Relationship - ?

Type: - ? One - One, One - Many, Many - One - ?

Arrangement - Ordered, Unordered -?

Count - Minimun, Maximum -?

Codegen under class in entities - ?
