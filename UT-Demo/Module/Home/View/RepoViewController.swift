//
//  UserViewController.swift
//  UT-Demo
//
//  Created by maithigiang on 8/4/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    var viewModel = RepoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        viewModel.getRepos()
        viewModel.repos.bindAndFire {[weak self] (_) in
            self?.tableView.reloadData()
        }
    }
    
    private func configView() {
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
    }
}

extension RepoViewController: UITableViewDelegate {
    
}

extension RepoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath)
            as? RepoTableViewCell else { return UITableViewCell() }
        cell.configCell(repo: viewModel.repos.value[indexPath.row])
        return cell
    }
}
