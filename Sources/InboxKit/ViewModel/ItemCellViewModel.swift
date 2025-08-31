//
//  ItemCellViewModel.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit

public protocol ItemCellViewModel {
    var model: InboxModel { get set }
}

public final class DefaultItemCellViewModel: ItemCellViewModel {
    public var model: InboxModel
    public init(model: InboxModel) {
        self.model = model
    }
}


