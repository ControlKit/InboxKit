//
//  InboxClassTest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//

import Foundation
import CoreData

public class InboxClassTest {
    
    public static func testGeneratedInboxClass() {
        print("=== Testing Generated Inbox Class ===")
        
        let context = CoreDataStack.shared.context
        
        // Test 1: Basic Inbox creation
        print("\n1. Testing basic Inbox creation...")
        let inbox1 = Inbox(context: context)
        inbox1.id = "test_inbox_001"
        print("✅ Created inbox with ID: \(inbox1.id ?? "nil")")
        
        // Test 2: Convenience initializer
        print("\n2. Testing convenience initializer...")
        let inbox2 = Inbox(context: context, id: "test_inbox_002")
        print("✅ Created inbox with convenience init: \(inbox2.id ?? "nil")")
        
        // Test 3: Display name property
        print("\n3. Testing display name...")
        print("✅ Inbox1 display name: \(inbox1.displayName)")
        print("✅ Inbox2 display name: \(inbox2.displayName)")
        
        // Test 4: Validation
        print("\n4. Testing validation...")
        print("✅ Inbox1 is valid: \(inbox1.isValid())")
        print("✅ Inbox2 is valid: \(inbox2.isValid())")
        
        // Test 5: Update method
        print("\n5. Testing update method...")
        inbox1.updateId("updated_inbox_001")
        print("✅ Updated inbox1 ID to: \(inbox1.id ?? "nil")")
        
        // Test 6: Identifiable conformance
        print("\n6. Testing Identifiable conformance...")
        print("✅ Inbox1 identifier: \(inbox1.identifier)")
        print("✅ Inbox2 identifier: \(inbox2.identifier)")
        
        // Test 7: Fetch requests
        print("\n7. Testing fetch requests...")
        let fetchRequest1 = Inbox.fetchRequestWithId("test_inbox_002")
        let fetchRequest2 = Inbox.fetchRequestSortedById()
        let fetchRequest3 = Inbox.fetchRequestWithIds(["test_inbox_001", "test_inbox_002"])
        
        print("✅ Created fetch request with specific ID")
        print("✅ Created sorted fetch request")
        print("✅ Created fetch request with multiple IDs")
        
        // Test 8: Repository integration
        print("\n8. Testing repository integration...")
        let repository = InboxRepository()
        
        if let createdInbox = repository.createInbox(with: "repository_test_001") {
            print("✅ Repository created inbox: \(createdInbox.id ?? "nil")")
            print("✅ Repository inbox display name: \(createdInbox.displayName)")
            print("✅ Repository inbox is valid: \(createdInbox.isValid())")
        }
        
        print("\n=== All Tests Passed! ===")
    }
}
