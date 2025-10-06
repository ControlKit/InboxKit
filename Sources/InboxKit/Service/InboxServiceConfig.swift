//
//  InboxServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct InboxServiceConfig {
    public init(style: InboxViewStyle = .darkMode,
                appId: String,
                language: CKLanguage,
                version: String) {
        self.viewConfig = InboxViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
        self.language = language
    }
    public var appId: String
    public var version: String
    public var language: CKLanguage
    public var sdkVersion: String = inboxKit_Version
    public var viewConfig: InboxViewConfig
}
