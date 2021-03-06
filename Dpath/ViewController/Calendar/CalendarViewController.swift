////
////  CalendarViewController.swift
////  Dpath
////
////  Created by 송영모 on 2022/05/21.
////
//
import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Then

class CalendarViewController: UIViewController, UIScrollViewDelegate {
    let viewModel = CalendarViewModel()
    var disposeBag = DisposeBag()
    
    var scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    var monthLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.text = "2022.5"
    }
    var weekLabelView = WeekLabelView()
    var datePicker = UIDatePicker().then {
            $0.timeZone = NSTimeZone.local
            $0.locale = Locale(identifier: "ko_KR")
            $0.minuteInterval = 10
            $0.datePickerMode = .date
            $0.backgroundColor = .white
            if #available(iOS 13.4, *) {
                $0.preferredDatePickerStyle = .wheels
            }
        }
    var prevCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }
    var nowCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }
    var nextCalendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }
    var bottomSheet = BottomSheetView().then {
        $0.backgroundColor = UIColor.white
    }
    var festivalTableView = UITableView().then {
        $0.register(FestivalTableViewCell.self, forCellReuseIdentifier: FestivalTableViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.rowHeight = 85
    }
    
    var scrollViewHeightConstraint = NSLayoutConstraint()
    var scrollViewBottomConstraint = NSLayoutConstraint()
    var bottomSheetHeightConstraint = NSLayoutConstraint()
    var datePickerHeightConstraint = NSLayoutConstraint()

    var nowCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!
    var prevCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!
    var nextCalendarCollectionViewAdaptor: CalendarCollectionViewAdaptor!
    var festivalTableViewAdaptor: FestivalTableViewAdaptor!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewAdaptor()
        setView()
        setBind()
        updateCalendarCollectionView()
        navigationController?.isNavigationBarHidden = true
    }
    
    func updateCalendarCollectionView() {
        prevCalendarCollectionView.reloadData()
        nowCalendarCollectionView.reloadData()
        nextCalendarCollectionView.reloadData()
    }
    
    func updateFestivalTableView() {
        festivalTableView.reloadData()
    }

}

extension CalendarViewController {
    func setViewAdaptor() {
        prevCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
        nowCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
        nextCalendarCollectionViewAdaptor = CalendarCollectionViewAdaptor(self)
        festivalTableViewAdaptor = FestivalTableViewAdaptor(self)
        
        prevCalendarCollectionView.delegate = prevCalendarCollectionViewAdaptor
        prevCalendarCollectionView.dataSource = prevCalendarCollectionViewAdaptor
        nowCalendarCollectionView.delegate = nowCalendarCollectionViewAdaptor
        nowCalendarCollectionView.dataSource = nowCalendarCollectionViewAdaptor
        nextCalendarCollectionView.delegate = nextCalendarCollectionViewAdaptor
        nextCalendarCollectionView.dataSource = nextCalendarCollectionViewAdaptor
        festivalTableView.delegate = festivalTableViewAdaptor
        festivalTableView.dataSource = festivalTableViewAdaptor
        
        scrollView.delegate = self
    }

    func setView() {
        view.addSubview(monthLabel)
        view.addSubview(weekLabelView)
        view.addSubview(scrollView)
        view.addSubview(bottomSheet)
        scrollView.addSubview(prevCalendarCollectionView)
        scrollView.addSubview(nowCalendarCollectionView)
        scrollView.addSubview(nextCalendarCollectionView)
        bottomSheet.addSubview(festivalTableView)
        view.addSubview(datePicker)
        
        datePicker.backgroundColor = .white

        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        weekLabelView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        bottomSheet.translatesAutoresizingMaskIntoConstraints = false
        prevCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        nowCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        nextCalendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        festivalTableView.translatesAutoresizingMaskIntoConstraints = false

//        scrollView.delegate = self
        
        scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomSheetHeightConstraint = bottomSheet.heightAnchor.constraint(equalToConstant: 0)
        datePickerHeightConstraint = datePicker.heightAnchor.constraint(equalToConstant: 0)
        
        hideBottomSheetView()
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            monthLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            datePicker.topAnchor.constraint(equalTo: monthLabel.bottomAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePickerHeightConstraint,
            
            weekLabelView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 15),
            weekLabelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            weekLabelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: weekLabelView.bottomAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollViewBottomConstraint,

            prevCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            prevCalendarCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            prevCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            prevCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            prevCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            nowCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            nowCalendarCollectionView.leadingAnchor.constraint(equalTo: prevCalendarCollectionView.trailingAnchor),
            nowCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            nowCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            nowCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            nextCalendarCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            nextCalendarCollectionView.leadingAnchor.constraint(equalTo: nowCalendarCollectionView.trailingAnchor),
            nextCalendarCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            nextCalendarCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            nextCalendarCollectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            nextCalendarCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            bottomSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomSheetHeightConstraint,
            
            festivalTableView.topAnchor.constraint(equalTo: bottomSheet.hideButton.bottomAnchor, constant: 10),
            festivalTableView.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor),
            festivalTableView.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor),
            festivalTableView.bottomAnchor.constraint(equalTo: bottomSheet.bottomAnchor),
        ])
    }
    
    func setBind() {
        bottomSheet.hideButton.rx.tap
            .map { true }
            .bind(to: viewModel.input.isBottonSheetHideButtonClick)
            .disposed(by: disposeBag)
        
        monthLabel.rx.tapGesture()
            .withUnretained(self)
            .bind { owner, tap in
                if tap.state.rawValue == 3 {
                    owner.viewModel.input.isDateLabelClick.onNext(true)
                }
            }
            .disposed(by: disposeBag)
        
        datePicker.rx.date
            .bind(to: viewModel.input.date)
            .disposed(by: disposeBag)
        
        viewModel.output.date
            .withUnretained(self)
            .bind { owner, date in
                Log(date)
                owner.monthLabel.text = date.dateString
                owner.bottomSheet.titleLabel.text = date.monthString
            }
            .disposed(by: disposeBag)
        
        viewModel.output.nowDates
            .withUnretained(self)
            .bind { owner, dates in
                owner.nowCalendarCollectionViewAdaptor.update(dates: dates)
                owner.nowCalendarCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.output.prevDates
            .withUnretained(self)
            .bind { owner, dates in
                owner.prevCalendarCollectionViewAdaptor.update(dates: dates)
                owner.prevCalendarCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.output.nextDates
            .withUnretained(self)
            .bind { owner, dates in
                owner.nextCalendarCollectionViewAdaptor.update(dates: dates)
                owner.nextCalendarCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
        
        viewModel.output.bottomSheetHide
            .withUnretained(self)
            .bind { owner, bool in
                if bool {
                    owner.hideBottomSheetView()
                } else {
                    owner.showBottomSheetView()
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.output.datePickerOpen
            .withUnretained(self)
            .bind { owner, bool in
                if bool {
                    owner.showDatePicker()
                } else {
                    owner.hideDatePiecker()
                }
            }
            .disposed(by: disposeBag)
    }
}

extension CalendarViewController {
    func showDatePicker() {
        datePickerHeightConstraint.constant = 290
        UIView.animate(withDuration: 0.25, animations: {
            self.datePickerHeightConstraint.isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
    func hideDatePiecker() {
        datePickerHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.25, animations: {
            self.datePickerHeightConstraint.isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
    func showBottomSheetView() {
        scrollViewBottomConstraint.constant = -400
        bottomSheetHeightConstraint.constant = 400

        self.scrollViewBottomConstraint.isActive = true
        self.bottomSheetHeightConstraint.isActive = true
        
        UIView.animate(withDuration: 0.25, animations: {
            self.bottomSheet.alpha = 1
            
            self.view.layoutIfNeeded()
            self.nowCalendarCollectionView.performBatchUpdates(nil)
            self.prevCalendarCollectionView.performBatchUpdates(nil)
            self.nextCalendarCollectionView.performBatchUpdates(nil)
        })

        for calendarCollectionViewCell in self.nowCalendarCollectionView.visibleCells {
            let cell = calendarCollectionViewCell as! CalendarCollectionViewCell
//                cell.hide()
        }
    }

    func hideBottomSheetView() {
        scrollViewBottomConstraint.constant = 0
        bottomSheetHeightConstraint.constant = 30
        
        self.scrollViewBottomConstraint.isActive = true
        self.bottomSheetHeightConstraint.isActive = true
        
        UIView.animate(withDuration: 0.25, animations: {
            self.bottomSheet.alpha = 0
            self.view.layoutIfNeeded()
            self.nowCalendarCollectionView.performBatchUpdates(nil)
            self.prevCalendarCollectionView.performBatchUpdates(nil)
            self.nextCalendarCollectionView.performBatchUpdates(nil)
        })

        for calendarCollectionViewCell in nowCalendarCollectionView.visibleCells {
            let cell = calendarCollectionViewCell as! CalendarCollectionViewCell
//            cell.show()
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > scrollView.frame.width {
            self.viewModel.input.date.onNext(try! self.viewModel.input.date.value().plusPeriod(Period.month, interval: 1))
            Log("다음 달")
        } else if scrollView.contentOffset.x < scrollView.frame.width {
            self.viewModel.input.date.onNext(try! self.viewModel.input.date.value().plusPeriod(Period.month, interval: -1))
            Log("이전 달")
        } else {
            Log("현재 달")
        }
        scrollView.contentOffset.x = scrollView.frame.width
    }
}
