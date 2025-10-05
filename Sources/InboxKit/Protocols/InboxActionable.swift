//
//  Actionable.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/5/25.
//
public protocol InboxActionable {
    func setAction(_ action: InboxAction)
}
public extension InboxActionable where Self: DetailViewModel {
    func setAction(_ action: InboxAction) {
        Task {
            let request = ActionRequest(appId: serviceConfig.appId, itemId: itemModel.id, action: action)
            let _ = try await actionService.action(request: request)
        }
    }
}
