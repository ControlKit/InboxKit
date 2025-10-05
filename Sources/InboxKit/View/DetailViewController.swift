//
//  File.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 8/31/25.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let viewModel: DetailViewModel
    let config: InboxServiceConfig

    init(viewModel: DetailViewModel, config: InboxServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = InboxViewPresenter(data: viewModel.itemModel,
                                        config: config.viewConfig).config
        let inboxView = InboxViewStyle.makeDetails(viewModel: viewModel,
                                                   config: config)
        view.addSubview(inboxView)
        inboxView.fixInView(view)
        viewModel.setAction(.view)
    }
}
