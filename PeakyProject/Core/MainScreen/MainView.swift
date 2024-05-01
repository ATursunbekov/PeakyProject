//
//  MianView.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
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
    
    lazy var footerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: DHeight(to: 50)))
        return view
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextImage"), for: .normal)
        return button
    }()
    
    lazy var loaderView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.tintColor = .black
        return loader
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
        
        tableView.tableFooterView = footerView
        
        footerView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(DHeight(to: 50))
        }
        
        addSubview(loaderView)
        loaderView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        loaderView.startAnimating()
        
        tableView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
