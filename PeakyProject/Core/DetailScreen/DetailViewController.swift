//
//  DetailViewController.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: ResultsModel
    
    init(item: ResultsModel) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    func setupData() {
        if let image = item.image_url {
            detailView.mainImage.kf.setImage(
                with: URL(string: image),
                placeholder: UIImage(named: "glob")
            )
        } else {
            detailView.mainImage.image = UIImage(named: "glob")
        }
        detailView.titleLabel.text = item.title
        detailView.authorLabel.text = (item.creator != nil && item.creator!.count > 0) ? item.creator![0] : "Unknown author"
        if let formattedDate = formatDate(from: item.pubDate, inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "dd.MM.yyyy") {
            detailView.dateLabel.text = formattedDate
        }
        detailView.descriptionLabel.text = item.description ?? ""
    }
    
    lazy var detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTargets()
        title = "News Detail"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: detailView.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: detailView.saveButton)
        checkState()
    }
    
    func checkState() {
        detailView.saveButton.setImage(UIImage(named: DataManager.shared.isIdPresent(item.article_id) ? "savedImage" : "saveImage"), for: .normal)
    }
    
    override func loadView() {
        view = detailView
    }
    
    func setupTargets() {
        detailView.backButton.addTarget(self, action: #selector(goBackPressed), for: .touchUpInside)
        detailView.saveButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    @objc func goBackPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func savePressed() {
        if DataManager.shared.isIdPresent(item.article_id) {
            DataManager.shared.removeId(idToRemove: item.article_id)
            detailView.saveButton.setImage(UIImage(named: "saveImage"), for: .normal)
        } else {
            DataManager.shared.addId(newId: item.article_id)
            detailView.saveButton.setImage(UIImage(named: "savedImage"), for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
