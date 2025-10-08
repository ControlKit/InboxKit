//
//  Inbox+CoreDataClass.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//
//
public import Foundation
public import CoreData
public typealias InboxCoreDataClassSet = NSSet
@objc(Inbox)
public class Inbox: NSManagedObject {
    public override var description: String {
        return "InboxKit.Inbox"
    }
}
