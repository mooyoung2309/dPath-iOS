//
//  CalendarCollectionViewApdator.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class CalendarCollectionViewAdaptor: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    weak var superVC: UIViewController!
    var dates: [Date] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ superVC: UIViewController) {
        super.init()
        self.superVC = superVC
    }
    
    func update(dates: [Date]) {
        self.dates = dates
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7.0
        let height = collectionView.frame.height / CGFloat(dates.count / 7 + 1)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as! CalendarCollectionViewCell
        
        cell.update(date: dates[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log(indexPath)
        if let calendarVC = superVC as? CalendarViewController {
            calendarVC.showBottomSheetView()
            calendarVC.viewModel.input.date.onNext(dates[indexPath.row])
        }
    }
}

