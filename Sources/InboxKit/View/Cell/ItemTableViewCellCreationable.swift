//
//  ItemTableViewCellCreationable.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit
protocol ItemTableViewCellCreationable {
    var titleLabel: UILabel { get set }
    var descriptionLabel: UILabel { get set }
    var dateLabel: UILabel { get set }
    var iconImageView: UIImageView { get set }
    
    func setupViews()
    
    func getTitleLabel() -> UILabel
    func getDescriptionLabel() -> UILabel
    func getDateLabel() -> UILabel
    func getIconImageView() -> UIImageView
    
    func configure(config: InboxViewConfig)
}
extension ItemTableViewCellCreationable where Self: ItemTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        addTitleLabel()
        addDescriptionLabel()
        addDateLabel()
        addIcon()
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
    func getIconImageView() -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = ImageHelper.image("arrow")
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
            constant: 42).isActive = true
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
            constant: 42).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: 42).isActive = true
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
            constant: 60).isActive = true
        dateLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -42).isActive = true
        NSLayoutConstraint(
            item: dateLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 20).isActive = true
    }
    
    func addIcon() {
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 30).isActive = true
        iconImageView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 14.36).isActive = true
        NSLayoutConstraint(
            item: iconImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 8.0).isActive = true
    }
    
    func configure(config: InboxViewConfig) {
        titleLabel.text = config.cell_Title
        titleLabel.font = config.cell_TitleFont
        titleLabel.textColor = config.cell_TitleColor
        
        descriptionLabel.text = config.cell_Description
        descriptionLabel.font = config.cell_DescriptionFont
        descriptionLabel.textColor = config.cell_DescriptionColor
        
        dateLabel.text = config.cell_Date
        dateLabel.font = config.cell_DateFont
        dateLabel.textColor = config.cell_DateColor
        iconImageView.image = iconImageView.image?.imageWithColor(color: config.cell_arrowIconColor)
    }
}

