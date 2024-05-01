//
//  MainViewController.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var mainView = MainView()
    var viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All News"
        setupDelegates()
        viewModel.getNews()
        setupTargets()
    }
    
    override func loadView() {
        view = mainView
    }
    
    func setupDelegates() {
        viewModel.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    func setupTargets() {
        mainView.nextButton.addTarget(self, action: #selector(footerButtonTapped), for: .touchUpInside)
    }
    
    @objc func footerButtonTapped() {
        print("Footer button tapped")
        viewModel.goToNextPage()
        mainView.tableView.setContentOffset(.zero, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.allNews.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        let item = viewModel.allNews[indexPath.section]
        let creator = (item.creator != nil && item.creator!.count > 0) ? item.creator![0] : "Unknown author"
        cell.configureData(image: item.image_url ?? "", title: item.title, author: creator, date: item.pubDate)
        if indexPath.section == viewModel.allNews.count - 1 {
            cell.hideDivider()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(item: viewModel.allNews[indexPath.section]), animated: true)
    }
}

extension MainViewController: MainViewDelegate {
    func updateData() {
        mainView.tableView.reloadData()
        mainView.tableView.isHidden = false
        mainView.loaderView.isHidden = true
    }
}
