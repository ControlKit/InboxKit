//
//  DetailViewModel.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit

public protocol DetailViewModel {
    var inboxService: InboxServiceProtocol { get set }
    var response: InboxResponse? { get set }
}

public final class DefaultDetailViewModel: DetailViewModel {
    public var response: InboxResponse?
    public var inboxService: InboxServiceProtocol
    public init(inboxService: InboxServiceProtocol = InboxService()) {
        self.inboxService = inboxService
    }
}
