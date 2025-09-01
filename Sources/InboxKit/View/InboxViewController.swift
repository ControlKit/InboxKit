//
//  InboxViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class InboxViewController: UIViewController {
    var viewModel: InboxViewModel
    let config: InboxServiceConfig

    init(viewModel: InboxViewModel, config: InboxServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let inboxView = InboxViewStyle.make(viewModel: viewModel,
                                            config: config.viewConfig)
        view.addSubview(inboxView)
        inboxView.fixInView(view)
        ItemTableViewCell.register(in: inboxView.tableView)
        inboxView.tableView.dataSource = self
        inboxView.tableView.delegate = self
        Task {
            viewModel.response = try await viewModel.inboxService.getInbox(request: viewModel.request)
            inboxView.tableView.reloadData()
        }
    }
}
