////
////  CalendarViewController.swift
////  Dpath
////
////  Created by 송영모 on 2022/05/21.
////
//
import UIKit
import Then

class CalendarViewController: UIViewController, UIScrollViewDelegate {
//
//    var scrollView = UIScrollView().then {
//        $0.isPagingEnabled = true
//        $0.showsHorizontalScrollIndicator = false
//    }
//    var datePicker = UIDatePicker().then {
//            $0.timeZone = NSTimeZone.local
//            $0.locale = Locale(identifier: "ko_KR")
//            $0.minuteInterval = 10
//            $0.datePickerMode = .date
//            $0.backgroundColor = .white
//            if #available(iOS 13.4, *) {
//                $0.preferredDatePickerStyle = .wheels
//            }
//        }
//    var prevCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
//    }
//    var nowCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
//    }
//    var nextCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
//    }
//    var bottomSheet = UIView()
//    var scrollViewHeightConstraint = NSLayoutConstraint()
//    var scrollViewBottomConstraint = NSLayoutConstraint()
//    var bottomSheetHeightConstraint = NSLayoutConstraint()
//    var datePickerHeightConstraint = NSLayoutConstraint()
//
//    var nowCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!
//    var prevCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!
//    var nextCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        setViewAdaptor()
//        setView()
//        updateCalendarCollectionView()
    }

}

//extension CalendarViewController {
//    func updateCalendarCollectionView() {
//        prevCalendarCollectionView.reloadData()
//        nowCalendarCollectionView.reloadData()
//        nextCalendarCollectionView.reloadData()
//    }
//
//    func setViewAdaptor() {
//        prevCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
//        nowCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
//        nextCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
//
//        prevCalendarCollectionView.delegate = prevCalendarCollectionViewAdaptor
//        prevCalendarCollectionView.dataSource = prevCalendarCollectionViewAdaptor
//
//        nowCalendarCollectionView.delegate = nowCalendarCollectionViewAdaptor
//        nowCalendarCollectionView.dataSource = nowCalendarCollectionViewAdaptor
//
//        nextCalendarCollectionView.delegate = nextCalendarCollectionViewAdaptor
//        nextCalendarCollectionView.dataSource = nextCalendarCollectionViewAdaptor
//
//        scrollView.delegate = self
//    }
//
//    func setView() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(prevCalendarCollectionView)
//        scrollView.addSubview(nowCalendarCollectionView)
//        scrollView.addSubview(nextCalendarCollectionView)
//
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        prevCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        nowCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        nextCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//
//            prevCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            prevCalendarCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            prevCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            prevCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//            prevCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            nowCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            nowCalendarCollectionView.leadingAnchor.constraint(equalTo: prevCalendarCollectionView.trailingAnchor),
//            nowCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            nowCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//            nowCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            nextCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            nextCalendarCollectionView.leadingAnchor.constraint(equalTo: nowCalendarCollectionView.trailingAnchor),
//            nextCalendarCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            nextCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            nextCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
//            nextCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//        ])
//    }
//}
//
//extension CalendarViewController {
//    func showBottomSheetView() {
////        scrollViewBottomConstraint.constant = -100
////        bottomSheetHeightConstraint.constant = Const.Size.calendarBottomSheetMinHeight
//
//        UIView.animate(withDuration: 0.25, animations: {
//            self.bottomSheet.alpha = 1
//            self.scrollViewBottomConstraint.isActive = true
//            self.bottomSheetHeightConstraint.isActive = true
//            self.view.layoutIfNeeded()
//            self.nowCalendarCollectionView.performBatchUpdates(nil)
//            self.prevCalendarCollectionView.performBatchUpdates(nil)
//            self.nextCalendarCollectionView.performBatchUpdates(nil)
//        }, completion: { _ in
//            self.nowCalendarCollectionView.reloadData()
//            self.prevCalendarCollectionView.reloadData()
//            self.nextCalendarCollectionView.reloadData()
//
//            UIView.animate(withDuration: 0.25, animations: {
//                self.nowCalendarCollectionView.performBatchUpdates(nil)
//                self.prevCalendarCollectionView.performBatchUpdates(nil)
//                self.nextCalendarCollectionView.performBatchUpdates(nil)
//            })
//
//            for calendarCollectionViewCell in self.nowCalendarCollectionView.visibleCells {
//                let cell = calendarCollectionViewCell as! CalendarCollectionViewCell
////                cell.hide()
//            }
//        })
//    }
//
//    func hideBottomSheetView() {
//        scrollViewBottomConstraint.constant = 0
//        bottomSheetHeightConstraint.constant = 10
//        UIView.animate(withDuration: 0.25, animations: {
//            self.bottomSheet.alpha = 0
//            self.scrollViewBottomConstraint.isActive = true
//            self.bottomSheetHeightConstraint.isActive = true
//            self.view.layoutIfNeeded()
//            self.nowCalendarCollectionView.performBatchUpdates(nil)
//            self.prevCalendarCollectionView.performBatchUpdates(nil)
//            self.nextCalendarCollectionView.performBatchUpdates(nil)
//        })
//
//        for calendarCollectionViewCell in nowCalendarCollectionView.visibleCells {
//            let cell = calendarCollectionViewCell as! CalendarCollectionViewCell
////            cell.show()
//        }
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        scrollView.contentOffset.x = scrollView.frame.width
//    }
//}
