//
//  InboxViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit
import ControlKitBase

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
    
    public static func makeDetails(viewModel: DetailViewModel,
                                   config: InboxViewConfig) -> DetailViewProtocol {
        switch config.style {
        case .darkMode:
            return DetailView_DarkMode(viewModel: viewModel,
                                       config: config)
        case .lightMode:
            return DetailView_LightMode(viewModel: viewModel,
                                        config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: InboxViewStyle, lang: CKLanguage) -> InboxViewConfig {
        switch style {
        case .darkMode:
            DarkModeInboxViewConfig(lang: lang)
        case .lightMode:
            LightModeInboxViewConfig(lang: lang)
        }
    }
}
