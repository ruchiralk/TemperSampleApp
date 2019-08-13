//
//  JSCardTableViewCell.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import SnapKit

class JSCardTableViewCell: RMCardTableViewCell {
    
    static let reuseIdentifier = "JSCardTableViewCell"
    static let headerViewHeight: CGFloat = 192.0
    static let footerViewHeight: CGFloat = 116.0
    static var cellHeight: CGFloat {
        return headerViewHeight + footerViewHeight
    }
    
    lazy var ratingLabel: RMICNLabel = {
        let label = RMICNLabel(frame: .zero)
        label.textLabel.text = "4.9"
        label.startIcon.image = UIImage(named: "Rating")
        label.textLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
        label.textLabel.textColor = UIColor(red: 101.0/255, green: 222.0/255, blue: 165.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var clientNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Ferilli's at The College Hotel"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(red: 80.0/255, green: 80.0/255, blue: 80.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var openPositionsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1 open positie vanaf CC14/u"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor(red: 115.0/255, green: 115.0/255, blue: 115.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var registrationsLabel: RMICNLabel = {
        let label = RMICNLabel(frame: .zero)
        label.textLabel.text = "1 aanmelding"
        label.startIcon.image = UIImage(named: "Users")
        label.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        label.textLabel.textColor = UIColor(red: 132.0/255, green: 132.0/255, blue: 132.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var startingTimeLabel: RMICNLabel = {
        let label = RMICNLabel(frame: .zero)
        label.textLabel.font = UIFont.systemFont(ofSize: 13.0, weight: .light)
        label.textLabel.text = "09.00 (6u)"
        label.startIcon.image = UIImage(named: "Clock")
        label.textLabel.textColor = UIColor(red: 132.0/255, green: 132.0/255, blue: 132.0/255, alpha: 1.0)
        return label
    }()
    
    lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 244.0/255, green: 243.0/255, blue: 244.0/255, alpha: 1.0)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var distanceLabel: RMICNLabel = {
        let label = RMICNLabel(frame: .zero)
        label.textLabel.textColor = UIColor.white
        label.textLabel.text = "9 km"
        label.textLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        label.startIcon.image = UIImage(named: "Home")
        return label
    }()
    
    private let margin = 10.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func initialize() {
        super.initialize()
        self.cardView.headerView.height = JSCardTableViewCell.headerViewHeight
        self.cardView.footerView.height = JSCardTableViewCell.footerViewHeight
        self.cardView.headerView.addSubview(bannerImageView)
        self.cardView.headerView.addSubview(distanceLabel)
        
        self.cardView.footerView.addSubview(clientNameLabel)
        self.cardView.footerView.addSubview(openPositionsLabel)
        self.cardView.footerView.addSubview(registrationsLabel)
        self.cardView.footerView.addSubview(ratingLabel)
        self.cardView.footerView.addSubview(startingTimeLabel)
        
        let shadowColor = UIColor(red: 225.0/255, green: 225.0/255, blue: 225.0/255, alpha: 1.0)
        RMShadowView.addShadow(toView: self.cardView, radius: 1, color: shadowColor, offset: CGSize(width: 3, height: 3), opacity: 1)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        bannerImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        distanceLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin)
        }
        
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(margin)
        }
        
        clientNameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.top.equalToSuperview().inset(15)
            make.trailing.equalTo(ratingLabel.snp.leading).inset(margin)
        }
        
        openPositionsLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.topMargin.equalTo(clientNameLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(margin)
        }
        
        registrationsLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin)
        }
        
        startingTimeLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(margin)
            make.bottom.equalToSuperview().inset(margin)
        }
    }

}
