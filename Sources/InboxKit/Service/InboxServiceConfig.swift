//
//  InboxServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct InboxServiceConfig {
    public init(style: InboxViewStyle = .darkMode,
                appId: String,
                language: CKLanguage) {
        self.viewConfig = InboxViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.language = language
    }
    public var appId: String
    public var language: CKLanguage
    public var sdkVersion: String = inboxKit_Version
    public var viewConfig: InboxViewConfig
}
