//
//  InboxServiceProtocol.swift
//  
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public protocol InboxServiceProtocol {
    func getInbox(request: InboxRequest) async throws -> InboxResponse?
}
