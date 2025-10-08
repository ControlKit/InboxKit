//
//  Inbox+CoreDataProperties.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//
//
public import Foundation
public import CoreData
public typealias InboxCoreDataPropertiesSet = NSSet
extension Inbox {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Inbox> {
        return NSFetchRequest<Inbox>(entityName: "Inbox")
    }
    @NSManaged public var id: String?
}
