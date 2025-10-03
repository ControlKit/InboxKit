//
//  InboxViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit
public protocol InboxViewProtocol: UIView {
    var tableView: UITableView { get set }
    var titleLabel: UILabel { get set }
    var emptyStateView: UIView { get set }
    var delegate: InboxDelegate? { get set }
}

public extension InboxViewProtocol {
}
