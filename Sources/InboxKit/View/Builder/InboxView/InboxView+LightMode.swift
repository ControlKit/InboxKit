//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//
import Foundation
import UIKit

public class InboxView_LightMode: UIView, InboxViewProtocol {
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

public class LightModeInboxViewConfig: InboxViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .darkMode
    }
}
