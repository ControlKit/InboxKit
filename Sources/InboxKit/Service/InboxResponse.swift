//
//  InboxResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias InboxLocalString = [InboxLocalizedText]

public struct InboxResponse: Codable {
    public var data: [InboxModel]?
}
public struct InboxModel: Codable {
    public let id: String
    public let title: InboxLocalString?
    public let description: InboxLocalString?
    public let created_at: String?
}
public struct InboxLocalizedText: Codable {
    public let language: String?
    public let content: String?
}
