//
//  InboxRepository.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//

import Foundation
import CoreData

public class InboxRepository {
    private let coreDataStack = CoreDataContext.shared
    
    public init() {}
    
    // MARK: - Create
    @discardableResult
    public func createInbox(with id: String) -> Inbox? {
        let context = coreDataStack.context
        guard getInbox(with: id) == nil else {
            return nil
        }
        let inbox = Inbox(context: context)
        inbox.id = id
        do {
            try context.save()
            return inbox
        } catch {
            print("Error creating inbox: \(error)")
            return nil
        }
    }
    
    // MARK: - Read
    public func getAllInboxes() -> [Inbox] {
        let request: NSFetchRequest<Inbox> = Inbox.fetchRequest()
        do {
            return try coreDataStack.context.fetch(request)
        } catch {
            print("Error fetching inboxes: \(error)")
            return []
        }
    }
    
    public func getInbox(with id: String) -> Inbox? {
        let request: NSFetchRequest<Inbox> = Inbox.fetchRequest()
        request.predicate = NSPredicate(format: "id == '%@'", id)
        request.fetchLimit = 1
        
        do {
            let results = try coreDataStack.context.fetch(request)
            return results.first
        } catch {
            print("Error fetching inbox with id \(id): \(error)")
            return nil
        }
    }
    
    // MARK: - Update
    public func updateInbox(_ inbox: Inbox, with newId: String) -> Bool {
        inbox.id = newId
        
        do {
            try coreDataStack.context.save()
            return true
        } catch {
            print("Error updating inbox: \(error)")
            return false
        }
    }
    
    // MARK: - Delete
    public func deleteInbox(_ inbox: Inbox) -> Bool {
        coreDataStack.context.delete(inbox)
        
        do {
            try coreDataStack.context.save()
            return true
        } catch {
            print("Error deleting inbox: \(error)")
            return false
        }
    }
    
    public func deleteInbox(with id: String) -> Bool {
        guard let inbox = getInbox(with: id) else {
            return false
        }
        return deleteInbox(inbox)
    }
    
    // MARK: - Count
    public func getInboxCount() -> Int {
        let request: NSFetchRequest<Inbox> = Inbox.fetchRequest()
        
        do {
            return try coreDataStack.context.count(for: request)
        } catch {
            print("Error counting inboxes: \(error)")
            return 0
        }
    }
}
