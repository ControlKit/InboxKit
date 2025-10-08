//
//  InboxViewController+TableView.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import UIKit
extension InboxViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.response?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.reusableId,
            for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        if let item = viewModel.response?.data?[indexPath.row] {
            cell.config(item: item, config: config.viewConfig, isExist: viewModel.messageCheck(id: item.id))
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let item = viewModel.response?.data?[indexPath.row] {
            let detailViewModel = DefaultDetailViewModel(
                itemModel: item,
                serviceConfig: config
            )
            let vc = DetailViewController(viewModel: detailViewModel, config: config)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
