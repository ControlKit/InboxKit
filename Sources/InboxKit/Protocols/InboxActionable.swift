//
//  Actionable.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 10/5/25.
//
import ControlKitBase
public protocol InboxActionable {
    func setAction(_ action: ControlKitAction)
}
public extension InboxActionable where Self: DetailViewModel {
    func setAction(_ action: ControlKitAction) {
        Task {
            var request = ControlKitBase.ActionRequest(
                route: .force_update,
                appId: serviceConfig.appId,
                sdkVersion: inboxKit_Version,
                action: action,
                itemId: self.itemModel.id,
            )
            request.extraParameter = "\(request.itemId ?? "")"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
}
