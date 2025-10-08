//
//  MessageReadSavable.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/8/25.
//
import CoreData
public protocol MessageReadSavable {
    func saveReadMessage(id: String)
}
public extension MessageReadSavable {
    func saveReadMessage(id: String) {
        let repository = InboxRepository()
        repository.createInbox(with: id)
    }
}
