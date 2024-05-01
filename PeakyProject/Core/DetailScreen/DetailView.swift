//
//  DetailView.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit

class DetailView: UIView {
    
    lazy var backButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    lazy var saveButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "saveImage"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "909090")
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(hex: "909090")
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(DWidth(to: 12))
            make.height.equalTo(DHeight(to: 223))
            make.top.equalToSuperview().offset(DHeight(to: 15))
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(DHeight(to: 24))
            make.leading.trailing.equalToSuperview().inset(DWidth(to: 12))
        }
        
        contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DWidth(to: 12))
            make.top.equalTo(titleLabel.snp.bottom).offset(DHeight(to: 15))
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DWidth(to: 12))
            make.top.equalTo(authorLabel.snp.bottom).offset(DHeight(to: 15))
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(DWidth(to: 12))
            make.top.equalTo(dateLabel.snp.bottom).offset(DHeight(to: 8))
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
