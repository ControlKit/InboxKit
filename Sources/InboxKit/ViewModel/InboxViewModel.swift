//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit
import ControlKitBase

public protocol InboxViewModel: Inboxable {
    var inboxService: GenericServiceProtocol { get set }
    var serviceConfig: InboxServiceConfig { get set }
    var response: InboxResponse? { get set }
    var request: InboxRequest { get }
    func messageCheck(id: String) -> Bool
}

public final class DefaultInboxViewModel: InboxViewModel {
    public var inboxService: GenericServiceProtocol
    public var serviceConfig: InboxServiceConfig
    public var response: InboxResponse?
    
    public init(inboxService: GenericServiceProtocol = GenericService(),
                serviceConfig: InboxServiceConfig) {
        self.inboxService = inboxService
        self.serviceConfig = serviceConfig
    }
    
    public var request: InboxRequest {
        return InboxRequest(appId: serviceConfig.appId,
                            sdkVersion: serviceConfig.sdkVersion)
    }
    
    public func messageCheck(id: String) -> Bool {
        let repository = InboxRepository()
        let message = repository.getInbox(with: id)
        return message != nil
    }
}
