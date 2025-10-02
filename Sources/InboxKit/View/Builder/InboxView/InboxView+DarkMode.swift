//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public protocol InboxDelegate: AnyObject {
    func dismiss()
}

public class InboxView_DarkMode: UIView, InboxViewProtocol {
    var config: InboxViewConfig
    var viewModel: InboxViewModel
    
    weak public var delegate: InboxDelegate?
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = config.contentViewBackColor
        return tableView
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public required init(viewModel: InboxViewModel,
                         config: InboxViewConfig) {
        self.config = config
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func commonInit() {
        tableView.fixInView(self)
    }
    
    public func setup() {
        addSubview(tableView)
        tableView.fixInView(self)
        commonInit()
    }
}

public class DarkModeInboxViewConfig: InboxViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .darkMode
        detailPage_TitleColor = .white
        detailPage_DateColor = UIColor(r: 121, g: 121, b: 121)
        detailPage_DescriptionColor = UIColor(r: 167, g: 167, b: 167)
        cell_DescriptionColor = UIColor(r: 213, g: 213, b: 213)
        cell_DateColor = UIColor(r: 213, g: 213, b: 213)
        cell_arrowIconColor = UIColor(r: 213, g: 213, b: 213)
    }
}

class ImageHelper {
    static var resolvedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: self)
#endif
    }
    
    static func image(_ name: String) -> UIImage? {
        return UIImage(named: name,
                       in: resolvedBundle,
                       compatibleWith: nil)
    }
}
