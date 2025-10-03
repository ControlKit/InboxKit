//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//
import Foundation
import UIKit

public class InboxView_LightMode: UIView, InboxViewProtocol, EmptyStateDelegate {
    var config: InboxViewConfig
    var viewModel: InboxViewModel
    
    weak public var delegate: InboxDelegate?
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = config.titleFont
        titleLabel.text = config.title
        titleLabel.textColor = config.titleColor
        titleLabel.textAlignment = config.rightToLeft ?.right : .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = config.contentViewBackColor
        return tableView
    }()
    
    public lazy var emptyStateView: UIView = {
        let emptyState = InboxViewEmptyState_LightMode(config: config)
        emptyState.delegate = self
        emptyState.backgroundColor = .clear
        return emptyState
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
    }
    
    public func setup() {
        backgroundColor = config.contentViewBackColor
        addSubview(titleLabel)
        addSubview(emptyStateView)
        addSubview(tableView)
        commonInit()
        setTitleLabelConstraint()
        setEmptyStateConstraint()
        setTableViewConstraint()
    }
    
    func setTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1,
            constant: 80).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 23).isActive = true
    }
    
    func setEmptyStateConstraint() {
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: emptyStateView,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 30).isActive = true
        emptyStateView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 0).isActive = true
        emptyStateView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: 0).isActive = true
        emptyStateView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor,
            constant: 0).isActive = true
    }
    
    func setTableViewConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: tableView,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 24).isActive = true
        tableView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 0).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: 0).isActive = true
        
        tableView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor,
            constant: 0).isActive = true
    }
    
    func didTapBack() {
        delegate?.dismiss()
    }
}

public class LightModeInboxViewConfig: InboxViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .lightMode
        titleColor = .black
        contentViewBackColor = .white
        detailPage_TitleColor = .black
        detailPage_DateColor = UIColor(r: 130, g: 130, b: 130)
        detailPage_DescriptionColor = UIColor(r: 92, g: 92, b: 92)
        cell_DescriptionColor = UIColor(r: 130, g: 130, b: 130)
        cell_DateColor = UIColor(r: 130, g: 130, b: 130)
        cell_arrowIconColor = UIColor(r: 130, g: 130, b: 130)
        cell_TitleColor = UIColor(r: 5, g: 95, b: 201)
    }
}
