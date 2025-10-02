//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol InboxViewModel {
    var inboxService: InboxServiceProtocol { get set }
    var serviceConfig: InboxServiceConfig { get set }
    var response: InboxResponse? { get set }
    var request: InboxRequest { get }
}

public final class DefaultInboxViewModel: InboxViewModel, Inboxable {
    public var inboxService: InboxServiceProtocol
    public var serviceConfig: InboxServiceConfig
    public var response: InboxResponse?
    
    public init(inboxService: InboxServiceProtocol = InboxService(),
                serviceConfig: InboxServiceConfig) {
        self.inboxService = inboxService
        self.serviceConfig = serviceConfig
    }
    
    public var request: InboxRequest {
        return InboxRequest(appId: serviceConfig.appId,
                            sdkVersion: serviceConfig.sdkVersion)
    }
}
