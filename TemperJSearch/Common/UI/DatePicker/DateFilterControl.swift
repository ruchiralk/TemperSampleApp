//
//  DayFilter.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 27/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit

class DatePickerControl : NSObject {
    
    private let reuseIdentifier = "DatePickerCell"
    var collectionView: UICollectionView?
    
    private let viewModel = DateFilterControlViewModel()
    
    func intialize(cellType: AnyClass, itemSize: CGSize) -> UIView? {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = itemSize
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView?.register(cellType, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        return collectionView
    }
}

extension DatePickerControl : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 365 // limit to one year
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let date = viewModel.dateFromCurrentDate(ahead: indexPath.row) {
            print(viewModel.dateStringInMMMDFormat(date: date))
        }
        return cell
    }

}
