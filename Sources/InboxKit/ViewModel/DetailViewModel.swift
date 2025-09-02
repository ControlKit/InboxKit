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
    var itemModel: InboxModel { get set }
}

public final class DefaultDetailViewModel: DetailViewModel {
    public var itemModel: InboxModel
    public var inboxService: InboxServiceProtocol
    public init(itemModel: InboxModel, inboxService: InboxServiceProtocol = InboxService()) {
        self.inboxService = inboxService
        self.itemModel = itemModel
    }
}
