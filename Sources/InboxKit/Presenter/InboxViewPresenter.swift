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
        if let date = data?.created_at {
            self.config.cell_Date = date.formatDate2()
            self.config.detailPage_Date = date.formatDate()
        }
        
        if let isHtml = data?.isHtml {
            self.config.isHtml = isHtml
        }
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

extension String {
    func formatDate() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
    func formatDate2() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MMM-dd"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
}
