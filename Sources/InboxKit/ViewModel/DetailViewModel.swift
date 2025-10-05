//
//  DetailViewModel.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit

public protocol DetailViewModel: InboxActionable {
    var actionService: ActionServiceProtocol { get set }
    var serviceConfig: InboxServiceConfig { get set }
    var itemModel: InboxModel { get set }
}

public final class DefaultDetailViewModel: DetailViewModel {
    public var itemModel: InboxModel
    public var actionService: ActionServiceProtocol
    public var serviceConfig: InboxServiceConfig
    public init(
        itemModel: InboxModel,
        serviceConfig: InboxServiceConfig,
        actionService: ActionServiceProtocol = ActionService()
    ) {
        self.actionService = actionService
        self.serviceConfig = serviceConfig
        self.itemModel = itemModel
    }
}
