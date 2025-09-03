//
//  DetailView+DarkMode.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit
import WebKit

public class DetailView_DarkMode: UIView, DetailViewProtocol {
    var config: InboxViewConfig
    var viewModel: DetailViewModel
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = config.detailPage_TitleFont
        titleLabel.text = config.detailPage_Title
        titleLabel.textColor = config.detailPage_TitleColor
        titleLabel.textAlignment = config.rightToLeft ?.right : .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = config.detailPage_DateFont
        dateLabel.text = config.detailPage_Date
        dateLabel.textColor = config.detailPage_DateColor
        dateLabel.textAlignment = config.rightToLeft ?.right : .left
        dateLabel.numberOfLines = 1
        return dateLabel
    }()
    
    lazy var underLineView: UIView = {
        let underLineView = UIView()
        underLineView.backgroundColor = config.underLineViewColor
        return underLineView
    }()
    
//    lazy var descriptionView: UITextView = {
//        let descriptionView = UITextView()
//        descriptionView.isEditable = false
//        descriptionView.font = config.detailPage_DescriptionFont
//        descriptionView.text = config.detailPage_Description
//        descriptionView.textColor = config.detailPage_DescriptionColor
//        descriptionView.textAlignment = config.rightToLeft ?.right : .left
//        descriptionView.backgroundColor = config.contentViewBackColor
//        return descriptionView
//    }()
    lazy var descriptionView: WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = config.contentViewBackColor
        webView.loadHTMLString(config.detailPage_Description, baseURL: nil)
        return webView
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(underLineView)
        contentView.addSubview(descriptionView)
        commonInit()
        setTitleViewConstraint()
        setDateViewConstraint()
        setUnderLineViewConstraint()
        setDescriptionConstraint()
    }
    
    public func setTitleViewConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 100).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: 24).isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: -24).isActive = true
    }
    
    public func setDateViewConstraint() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        dateLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 24).isActive = true
    }
    
    public func setUnderLineViewConstraint() {
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: underLineView,
            attribute: .top,
            relatedBy: .equal,
            toItem: dateLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 14).isActive = true
        underLineView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        underLineView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        
        NSLayoutConstraint(
            item: underLineView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 1).isActive = true
    }
    
    public func setDescriptionConstraint() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionView,
            attribute: .top,
            relatedBy: .equal,
            toItem: underLineView,
            attribute: .centerY,
            multiplier: 1,
            constant: 14).isActive = true
        
        descriptionView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        descriptionView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        let height = UIScreen.main.bounds.height - 200
        NSLayoutConstraint(
            item: descriptionView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: height).isActive = true
    }
}
