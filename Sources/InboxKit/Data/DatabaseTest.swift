//
//  DatabaseTest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//

import Foundation
import CoreData

public class DatabaseTest {
    
    public static func testDatabaseConnection() {
        print("=== Testing Database Connection ===")
        
        // Test CoreDataStack
        let coreDataStack = CoreDataContext.shared
        print("✅ CoreDataStack initialized")
        
        // Test Repository
        let repository = InboxRepository()
        print("✅ InboxRepository initialized")
        
        // Test creating and saving
        print("\n--- Testing Save Operations ---")
        
        if let inbox1 = repository.createInbox(with: "test_001") {
            print("✅ Created and saved inbox: \(inbox1.id ?? "nil")")
        } else {
            print("❌ Failed to create inbox")
        }
        
        if let inbox2 = repository.createInbox(with: "test_002") {
            print("✅ Created and saved inbox: \(inbox2.id ?? "nil")")
        } else {
            print("❌ Failed to create inbox")
        }
        
        // Test reading
        print("\n--- Testing Read Operations ---")
        let allInboxes = repository.getAllInboxes()
        print("✅ Found \(allInboxes.count) inboxes in database")
        
        for (index, inbox) in allInboxes.enumerated() {
            print("  \(index + 1). ID: \(inbox.id ?? "nil")")
        }
        
        // Test count
        let count = repository.getInboxCount()
        print("✅ Total count: \(count)")
        
        print("\n=== Database Test Completed ===")
    }
}
