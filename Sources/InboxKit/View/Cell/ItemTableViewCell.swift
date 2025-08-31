//
//  ItemTableViewCell.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import UIKit
class ItemTableViewCell: UITableViewCell,
                         ItemTableViewCellCreationable {
    lazy var titleLabel: UILabel = getTitleLabel()
    lazy var descriptionLabel: UILabel = getDescriptionLabel()
    lazy var dateLabel: UILabel = getDateLabel()
    lazy var iconImageView: UIImageView = getIconImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func config(item: InboxModel, config: InboxViewConfig) {
        let config = InboxViewPresenter(data: item, config: config).config
        configure(config: config)
    }
    
    static var reusableId: String {
        return String(describing: self)
    }
    
    static func register(in tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: Self.reusableId)
    }
}
