//
//  InboxRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct InboxRequest {
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var route: String
    public var lastInboxId: String = UserDefaults.standard.string(forKey: String.Key.inboxId.rawValue) ?? String("1")
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = inboxKit_Version
    
    var dictionary: [String: String] {
        return ["x-app-id": appId,
                "x-last-id": lastInboxId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
