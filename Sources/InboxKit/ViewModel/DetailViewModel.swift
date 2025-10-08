//
//  DetailViewModel.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit
import ControlKitBase

public protocol DetailViewModel: InboxActionable, MessageReadSavable {
    var actionService: GenericServiceProtocol { get set }
    var serviceConfig: InboxServiceConfig { get set }
    var itemModel: InboxModel { get set }
    func saveReadMessage() 
}

public final class DefaultDetailViewModel: DetailViewModel {
    public var itemModel: InboxModel
    public var actionService: GenericServiceProtocol
    public var serviceConfig: InboxServiceConfig
    public init(
        itemModel: InboxModel,
        serviceConfig: InboxServiceConfig,
        actionService: GenericServiceProtocol = GenericService()
    ) {
        self.actionService = actionService
        self.serviceConfig = serviceConfig
        self.itemModel = itemModel
    }
    
    public func saveReadMessage() {
        saveReadMessage(id: itemModel.id)
    }
}
