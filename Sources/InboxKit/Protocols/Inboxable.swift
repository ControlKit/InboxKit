//
//  Inboxtable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation
import ControlKitBase

public protocol Inboxable: AnyObject {
    var inboxService: GenericServiceProtocol { get }
    func getInbox(request: InboxRequest) async throws -> Result<InboxResponse>?
}

extension Inboxable {
    public func getInbox(request: InboxRequest) async throws -> Result<InboxResponse>? {
        return try await inboxService.execute(request: request)
    }
}
