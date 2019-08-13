//
//  JSTableViewController.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
import NVActivityIndicatorView
import SnapKit

class JSTableViewController: UITableViewController {

    private lazy var datePickerControl : RMDatePickerControl = {
        let datePicker = RMDatePickerControl()
        datePicker.backgroundColor = UIColor.white
        return datePicker
    }()
    private let disposeBag = DisposeBag()
    var jsViewModel = JSViewModel()
    private let datePickerHeight: CGFloat = 66.0
    
    var activityIndictorView: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureActivityIndicator()
        configureObservers()
    }
    
    private func configureTableView(){
        self.tableView.separatorStyle = .none
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.allowsSelection = false // haven't implemented any actions for cell selection. disabling
        self.tableView.tableHeaderView = JSTableViewHeader.install()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.dataSource = nil // allow RxCocoa to set the datasource
        self.tableView.register(JSCardTableViewCell.self, forCellReuseIdentifier: JSCardTableViewCell.reuseIdentifier)
    }
    
    private func configureObservers(){
        // Subscribe to searchResults returned from Temper search API
        jsViewModel.searchResults
            .bind(to: tableView.rx.items(cellIdentifier: JSCardTableViewCell.reuseIdentifier, cellType: JSCardTableViewCell.self)){ (index: Int, model: TWContractor, cell: JSCardTableViewCell) in
                
                cell.clientNameLabel.text = model.title
                
                if let shift = model.shifts?[0] {
                    cell.startingTimeLabel.textLabel.text = shift.startTime
                }
                
                if let photos = model.client?.photos, photos.count > 0, let bannerUrl = photos[0].formats?[0].cdnUrl {
                    cell.bannerImageView.kf.setImage(
                        with: URL(string:  bannerUrl),
                        placeholder: nil,
                        options:[
                            .scaleFactor(UIScreen.main.scale)
                    ])
                }
            }
            .disposed(by: disposeBag)
        
        // isActive indicates active API call status,
        // if network request is active show activity indicator
        jsViewModel.isActive
        .asObservable()
        .distinctUntilChanged()
        .observeOn(MainScheduler.instance)
        .subscribe { [weak self](event) in
            if event.element == true {
                self?.activityIndictorView?.startAnimating()
            }else{
                self?.activityIndictorView?.stopAnimating()
            }
        }
        .disposed(by: disposeBag)
        
        // bind viewModel selected Date to JSViewModel
        datePickerControl.selectedDate
        .bind(to: jsViewModel.selectedDate)
        .disposed(by: disposeBag)
        
    }
    
    private func configureActivityIndicator(){
        activityIndictorView = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: UIColor(red: 99.0/255, green: 81.0/255, blue: 178.0/255, alpha: 1.0), padding: nil)
        self.tableView.addSubview(activityIndictorView!)
        activityIndictorView?.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return datePickerHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return datePickerControl.intialize(cellType: RMDatePickerCollectionViewCell.self, itemSize: CGSize(width: 90, height: datePickerHeight - 30))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return JSCardTableViewCell.cellHeight
    }
}



