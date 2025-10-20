//
//  ItemTableViewCellCreationable.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit
import ControlKitBase
protocol ItemTableViewCellCreationable {
    var titleLabel: UILabel { get set }
    var descriptionLabel: UILabel { get set }
    var dateLabel: UILabel { get set }
    var arrowIconImageView: UIImageView { get set }
    var unreadIconImageView: UIImageView { get set }
    
    func setupViews()
    
    func getTitleLabel() -> UILabel
    func getDescriptionLabel() -> UILabel
    func getDateLabel() -> UILabel
    func getArrowIconImageView() -> UIImageView
    func getUnreadIconImageView() -> UIImageView
    
    func configure(config: InboxViewConfig, isExist: Bool)
}
extension ItemTableViewCellCreationable where Self: ItemTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        addTitleLabel()
        addDescriptionLabel()
        addDateLabel()
        addArrowIcon()
        addUnreadIcon()
    }
    func getTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    func getDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    func getDateLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }
    func getArrowIconImageView() -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = ImageHelper.image("arrow")
        return img
    }
    func getUnreadIconImageView() -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = ImageHelper.image("dot-icon")
        return img
    }
    func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 24).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 24).isActive = true
        
    }
    func addDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -42).isActive = true
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .height,
            relatedBy: .greaterThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 23).isActive = true
    }
    func addDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .left,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .right,
            multiplier: 1,
            constant: 20).isActive = true
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 20).isActive = true
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 80).isActive = true
    }
    func addArrowIcon() {
        contentView.addSubview(arrowIconImageView)
        arrowIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: arrowIconImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 25).isActive = true
        NSLayoutConstraint(
            item: arrowIconImageView,
            attribute: .left,
            relatedBy: .equal,
            toItem: dateLabel,
            attribute: .right,
            multiplier: 1,
            constant: 10).isActive = true
        arrowIconImageView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: arrowIconImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 14.36).isActive = true
        NSLayoutConstraint(
            item: arrowIconImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 8.0).isActive = true
    }
    func addUnreadIcon() {
        contentView.addSubview(unreadIconImageView)
        unreadIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: unreadIconImageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1,
            constant: 22.0).isActive = true
        unreadIconImageView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: unreadIconImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 16.0).isActive = true
        NSLayoutConstraint(
            item: unreadIconImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 16.0).isActive = true
    }
    func configure(config: InboxViewConfig, isExist: Bool) {
        titleLabel.text = config.cell_Title
        titleLabel.font = config.cell_TitleFont
        titleLabel.textColor = config.cell_TitleColor
        
        descriptionLabel.text = config.cell_Description
        descriptionLabel.font = config.cell_DescriptionFont
        descriptionLabel.textColor = config.cell_DescriptionColor
        
        dateLabel.text = config.cell_Date
        dateLabel.font = config.cell_DateFont
        dateLabel.textColor = config.cell_DateColor
        arrowIconImageView.image = arrowIconImageView.image?.imageWithColor(color: config.cell_arrowIconColor)
        if isExist {
            unreadIconImageView.isHidden = true
        } else {
            unreadIconImageView.isHidden = false
        }
    }
}

