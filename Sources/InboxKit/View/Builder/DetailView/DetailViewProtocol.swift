//
//  DetailViewProtocol.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//
import Foundation
import UIKit
public protocol DetailViewProtocol: UIView {
    var delegate: DetailDelegate? { get set }
}

public extension DetailViewProtocol {
}
