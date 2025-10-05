//
//  ActionRequest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionRequest {
    public var appId: String
    public var itemId: String
    public var action: InboxAction
    public var route: String = "https://tauri.ir/api/inbox-view/"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = inboxKit_Version
    
    var dictionary: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    
    var params: [String: String] {
        return ["action": action.rawValue]
    }
}

public enum InboxAction: String {
    case view = "VIEW"
}
