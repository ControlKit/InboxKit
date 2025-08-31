//
//  DetailViewStyle.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit

public enum DetailViewStyle {
    case darkMode
    case lightMode
    public static func make(viewModel: DetailViewModel,
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
    
    public static func getViewConfigWithStyle(style: DetailViewStyle, lang: String) -> InboxViewConfig {
        switch style {
        case .darkMode:
            DarkModeInboxViewConfig(lang: lang)
        case .lightMode:
            LightModeInboxViewConfig(lang: lang)
        }
    }
}
