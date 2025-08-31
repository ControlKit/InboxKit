//
//  Inboxtable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol Inboxable: AnyObject {
    var inboxService: InboxServiceProtocol { get }
    func getInbox(request: InboxRequest) async throws -> InboxResponse?
}

extension Inboxable {
    public func getInbox(request: InboxRequest) async throws -> InboxResponse? {
        return try await inboxService.getInbox(request: request)
    }
}
