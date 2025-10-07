//
//  InboxResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase

public struct InboxResponse: Codable {
    public var data: [InboxModel]?
}
public struct InboxModel: Codable {
    public let id: String
    public let title: LocalString?
    public let description: LocalString?
    public let created_at: String?
}
