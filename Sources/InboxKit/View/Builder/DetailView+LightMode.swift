//
//  DetailView+LightMode.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit

public protocol DetailDelegate: AnyObject {
    func dismiss()
}

public class DetailView_LightMode: UIView, DetailViewProtocol {
    var config: InboxViewConfig
    var viewModel: DetailViewModel
    
    weak public var delegate: DetailDelegate?
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = config.titleFont
        headerTitle.text = config.title
        headerTitle.textColor = config.titleColor
        headerTitle.textAlignment = .center
        headerTitle.numberOfLines = 0
        return headerTitle
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = config.detailPage_DescriptionFont
        descriptionLabel.text = config.detailPage_Description
        descriptionLabel.textColor = config.detailPage_DescriptionColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.setCurvedView(cornerRadius: 20)
    }
    
    public required init(viewModel: DetailViewModel,
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
        contentView.fixInView(self)
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(headerTitle)
        contentView.addSubview(descriptionLabel)
        commonInit()
        setTitleViewConstraint()
        setDescriptionConstraint()
    }
    
    public func setTitleViewConstraint() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: descriptionLabel,
            attribute: .top,
            multiplier: 1,
            constant: -16).isActive = true
        
        headerTitle.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        
        NSLayoutConstraint(
            item: headerTitle,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    
    public func setDescriptionConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
    }
}

public class LightModeDetailViewConfig: InboxViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .lightMode
    }
}

