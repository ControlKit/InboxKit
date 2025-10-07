//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
import ControlKitBase
public class InboxViewConfig {
    public init(lang: CKLanguage) {
        self.lang = lang
    }
    
    public let lang: CKLanguage
    public var rightToLeft: Bool = false
    public var style: InboxViewStyle = .darkMode
    public var contentViewBackColor: UIColor = UIColor(r: 0, g: 0, b: 0, a: 1.0)
    public var underLineViewColor: UIColor = UIColor(r: 233, g: 233, b: 233, a: 1.0)
    
    public var titleFont = UIFont.systemFont(ofSize: 24, weight: .heavy)
    public var title = "Inbox"
    public var titleColor: UIColor = .white
    
    public var cell_TitleFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    public var cell_Title = "It's an Inbox"
    public var cell_TitleColor: UIColor = UIColor(r: 81, g: 81, b: 254)
    
    public var cell_DescriptionFont = UIFont.systemFont(ofSize: 13, weight: .medium)
    public var cell_Description = "It's an Inbox"
    public var cell_DescriptionColor: UIColor = UIColor(r: 213, g: 213, b: 213)
    
    public var cell_DateFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    public var cell_Date = "date"
    public var cell_DateColor: UIColor = UIColor(r: 213, g: 213, b: 213)
    
    public var detailPage_TitleFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    public var detailPage_Title = "It's an Email"
    public var detailPage_TitleColor: UIColor = UIColor(r: 0, g: 0, b: 0)
    
    public var detailPage_DescriptionFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    public var detailPage_Description = "It's an description"
    public var detailPage_DescriptionColor: UIColor = UIColor(r: 92, g: 92, b: 92)
    
    public var detailPage_DateFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var detailPage_Date = "Date-x"
    public var detailPage_DateColor: UIColor = UIColor(r: 130, g: 130, b: 130)
    
    public var cell_ContentViewBGColor: UIColor = UIColor(r: 18, g: 18, b: 18)
    public var cell_separatorColor: UIColor =  UIColor(r: 29, g: 32, b: 37)
    public var cell_arrowIconColor: UIColor =  UIColor(r: 29, g: 32, b: 37)
    
    public var emptyState_titleFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    public var emptyState_title = "YOU HAVE NO MESSAGES"
    public var emptyState_titleColor: UIColor = UIColor(r: 84, g: 84, b: 84)
    
    public var emptyState_DescriptionFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    public var emptyState_Description = "Your inbox is empty."
    public var emptyState_DescriptionColor: UIColor = UIColor(r: 84, g: 84, b: 84)
    
    public var emptyState_ImageColor: UIColor?
    
    public var emptyState_ButtonFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    public var emptyState_ButtonNormalTitle: String = "Back"
    public var emptyState_ButtonBackColor: UIColor = UIColor(r: 145, g: 145, b: 145)
    public var emptyState_ButtonTitleColor: UIColor = .white
    public var emptyState_ButtonCornerRadius: CGFloat = 20.0
    public var emptyState_ButtonBorderWidth: CGFloat = 0.0
    public var emptyState_ButtonBorderColor: UIColor = .clear
}
