//
//  CoreDataStack.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//

import Foundation
import CoreData

public class CoreDataContext {
    public static let shared = CoreDataContext()
    
    private init() {}
    
    open class PersistentContainer: NSPersistentContainer, @unchecked Sendable {
    }
        
    lazy public var persistentContainer: PersistentContainer? = {
        guard let modelURL = Bundle.module.url(forResource:"InboxKit", withExtension: "momd") else { return  nil }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else { return nil }
        let container = PersistentContainer(name:"InboxKit",managedObjectModel:model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer?.viewContext ?? NSManagedObjectContext()
    }
    
    func save() {
        let context = persistentContainer?.viewContext ?? NSManagedObjectContext()
        
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



