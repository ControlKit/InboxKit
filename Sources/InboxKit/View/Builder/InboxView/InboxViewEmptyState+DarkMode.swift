//
//  InoxViewEmptyState+DarkMode.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/3/25.
//
import UIKit
public class InoxViewEmptyState_DarkMode: UIView {
    var config: InboxViewConfig
    weak var delegate: EmptyStateDelegate?
    public required init(config: InboxViewConfig) {
        self.config = DarkModeEmptyInboxViewConfig(lang: config.lang)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let img = ImageHelper.image("empty-icon-dark")
        if let color = config.emptyState_ImageColor {
            imageView.image = img?.imageWithColor(color: color)
        }
        imageView.image = img
        return imageView
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = config.emptyState_titleFont
        titleLabel.text = config.emptyState_title
        titleLabel.textColor = config.emptyState_titleColor
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = config.emptyState_DescriptionFont
        descriptionLabel.text = config.emptyState_Description
        descriptionLabel.textColor = config.emptyState_DescriptionColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.emptyState_ButtonBackColor
        button.titleLabel?.textColor = config.emptyState_ButtonTitleColor
        button.setTitle(config.emptyState_ButtonNormalTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.emptyState_ButtonCornerRadius,
                             borderWidth: config.emptyState_ButtonBorderWidth,
                             borderColor: config.emptyState_ButtonBorderColor)
        button.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
        button.titleLabel?.font = config.emptyState_ButtonFont
        button.setTitleColor(config.emptyState_ButtonTitleColor, for: .normal)
        return button
    }()
    @objc
    func backNavigate() {
        delegate?.didTapBack()
    }
    public func commonInit() {
    }
    
    public func setup() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        commonInit()
        setImageViewConstraint()
        setTitleLabelConstraint()
        setDescriptionLabelConstraint()
        setButtonConstraint()
    }
    
    func setImageViewConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: imageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: imageView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .top,
            multiplier: 1,
            constant: -45).isActive = true
        NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 122).isActive = true
        NSLayoutConstraint(
            item: imageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 122).isActive = true
    }
    
    func setTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: imageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: imageView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1,
            constant: -100).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 23).isActive = true
    }
    
    func setDescriptionLabelConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 18).isActive = true
        descriptionLabel.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 24).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: descriptionLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 23).isActive = true
    }
    public func setButtonConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: button,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 53).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 250).isActive = true
        NSLayoutConstraint(
            item: button,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 52).isActive = true
    }
}

public class DarkModeEmptyInboxViewConfig: InboxViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .darkMode
        emptyState_titleColor = .white
        emptyState_DescriptionColor = .white
        emptyState_ButtonTitleColor = .black
        emptyState_ButtonBackColor = .white
    }
}
    
