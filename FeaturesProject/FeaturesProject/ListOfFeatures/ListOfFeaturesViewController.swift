//
//  ListOfFeaturesViewController.swift
//  FeaturesProject
//
//  Created by Veronika Goreva on 7/9/20.
//  Copyright © 2020 v.wolf.g. All rights reserved.
//

import UIKit
import Reusable
import Cartography

class ListOfFeaturesViewController: UIViewController, StoryboardBased {
    
    // MARK: - UIComponents
    
    @IBOutlet private var tableView: UITableView!
    private lazy var headerView: UIView = {
        let headerView = UIView()
        
        return headerView
    }()
    
    // MARK: - Properties
    
    private let features: [Features] = Features.allCases
    
    // MARK: - Lifecycle
    
    class func instantiate(with viewModel: Bool) -> ListOfFeaturesViewController {
        let controller = ListOfFeaturesViewController.instantiate()
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    // MARK: - Private
    
    private func configureUI() {
    }
    
    private func configureTableView() {
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        let headerView = StrachedView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
               headerView.imageView.image = UIImage(named: "2")
               self.tableView.tableHeaderView = headerView
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ListOfFeaturesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Item \(indexPath.row)"
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let headerView = tableView.tableHeaderView as? StrachedView else { return }
        headerView.scrollViewDidScroll(scrollView)
    }
}
