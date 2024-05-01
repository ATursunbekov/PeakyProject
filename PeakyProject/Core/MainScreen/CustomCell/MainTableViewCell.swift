//
//  MainTableViewCell.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import UIKit
import Kingfisher
import SnapKit

class MainTableViewCell: UITableViewCell {
    static let identifier = "MainTableViewCell"
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 4
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
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#EEEEEE")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.top)
            make.leading.equalTo(mainImage.snp.trailing).offset(6)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(mainImage.snp.trailing).offset(6)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.bottom)
            make.leading.equalTo(mainImage.snp.trailing).offset(6)
        }
        
        contentView.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    func configureData(image: String, title: String, author: String, date: String) {
        if image == "" {
            mainImage.image = UIImage(named: "glob")
        } else {
            mainImage.kf.setImage(
                with: URL(string: image),
                placeholder: UIImage(named: "glob")
            )
        }
        titleLabel.text = title
        authorLabel.text = author
        if let formattedDate = formatDate(from: "2024-04-29 18:54:00", inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "dd.MM.yyyy") {
            dateLabel.text = formattedDate
        }
    }
    
    func hideDivider() {
        dividerView.isHidden = true
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
