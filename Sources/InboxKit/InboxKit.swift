// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class InboxKit {
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: InboxServiceConfig) async {
        Task {
            let viewModel = DefaultInboxViewModel(serviceConfig: config)
            let inboxVC = InboxViewController(
                viewModel: viewModel,
                config: config
            )
            let navigationVontroller = UINavigationController(rootViewController: inboxVC)
            navigationVontroller.modalPresentationStyle = modalPresentationStyle
            DispatchQueue.main.async {
                root.present(navigationVontroller, animated: true)
            }
        }
    }
}
