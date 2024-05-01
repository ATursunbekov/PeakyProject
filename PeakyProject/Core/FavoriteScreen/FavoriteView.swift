//
//  FavoriteView.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 1/5/24.
//

import UIKit

class FavoriteView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 180
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        emptyLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
