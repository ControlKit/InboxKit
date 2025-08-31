//
//  InboxViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum InboxViewStyle {
    case darkMode
    case lightMode
    public static func make(viewModel: InboxViewModel,
                            config: InboxViewConfig) -> InboxViewProtocol {
        switch config.style {
        case .darkMode:
            return InboxView_DarkMode(viewModel: viewModel,
                                      config: config)
        case .lightMode:
            return InboxView_LightMode(viewModel: viewModel,
                                       config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: InboxViewStyle, lang: String) -> InboxViewConfig {
        switch style {
        case .darkMode:
            DarkModeInboxViewConfig(lang: lang)
        case .lightMode:
            LightModeInboxViewConfig(lang: lang)
        }
    }
}
