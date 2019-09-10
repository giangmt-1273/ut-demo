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
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        viewModel.getRepos(completion: {_ in 
            
        })
        viewModel.repos.bindAndFire {[weak self] (_) in
            self?.tableView.reloadData()
        }
        viewModel.error.bind ({ [weak self](error) in
            guard let strongSelf = self else { return }
            AlertManager
                .showErrorMessage(errorDataResponse: error,
                                          parent: strongSelf) {
                // handle logic
            }
            
        })
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
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {


            if viewModel.pagnigation.isLoadMore && viewModel.beginFetchData {
                 viewModel.beginFetchData = false
                viewModel.getRepos {_ in
                    self.viewModel.beginFetchData = true
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
}
