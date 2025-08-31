//
//  InboxPresenter.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/26/25.
//
import Foundation
import UIKit
public struct InboxViewPresenter {
    var config: InboxViewConfig
    public init(data: InboxModel?, config: InboxViewConfig) {
        self.config = config
        if let localTitle = data?.title,
            let title = getLocalizeString(localTitle) {
            self.config.detailPage_Title = title
            self.config.cell_Title = title
        }
        if let localDescription = data?.description,
           let description = getLocalizeString(localDescription) {
            self.config.detailPage_Description = description
            self.config.cell_Description = description
        }
        if let date = data?.date { self.config.detailPage_Date = date }
    }
    
    func getLocalizeString(_ localize: InboxLocalString) -> String? {
        guard let localizeString = localize.first(where: { $0.language == config.lang }) else {
            if let defaultLang = localize.first(where: { $0.language == "en" }) {
                return defaultLang.content
            } else {
                return nil
            }
        }
        return localizeString.content
    }
}
