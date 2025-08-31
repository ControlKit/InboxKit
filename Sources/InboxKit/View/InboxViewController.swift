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

extension InboxViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.response?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.reusableId,
            for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        if let item = viewModel.response?.data?[indexPath.row] {
            cell.config(item: item, config: config.viewConfig)
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
