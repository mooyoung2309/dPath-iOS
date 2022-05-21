//
//  CalendarViewModel.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class CalendarViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    var input = Input()
    var output = Output()
    
    struct Input {
        let date = BehaviorSubject(value: Date())
        let isClickedHeaderView = BehaviorSubject(value: false)
        let isClickedCalendarCell = BehaviorSubject(value: false)
        let isBottonSheetHideButtonClick = PublishSubject<Bool>()
    }
    
    struct Output {
        let date = BehaviorRelay(value: Date())
        let bottomSheetHide = BehaviorRelay(value: true)
//        let prevCalendarItems = BehaviorRelay(value: [CalendarItem()])
//        let nowCalendarItems = BehaviorRelay(value: [CalendarItem()])
//        let nextCalendarItems = BehaviorRelay(value: [CalendarItem()])
//        let isShowHeaderView = BehaviorRelay(value: false)
//        let isShowBottomSheetView = BehaviorRelay(value: false)
//        let selectedCalendarItem = BehaviorRelay(value: CalendarItem())
//        let bottomSheetCalendarItem = BehaviorRelay(value: CalendarItem())
    }
    
    init() {
        setBind()
//        input.date.onNext(Date())
    }
}

extension CalendarViewModel {
    func setBind() {
        input.isBottonSheetHideButtonClick
            .bind(to: output.bottomSheetHide)
            .disposed(by: disposeBag)
        
//        input.date
//            .bind(to: output.date)
//            .disposed(by: disposeBag)
//
//        input.isClickedHeaderView
//            .bind(to: output.isShowHeaderView)
//            .disposed(by: disposeBag)
//
//        input.isClickedCalendarItem
//            .bind(to: output.bottomSheetCalendarItem)
//            .disposed(by: disposeBag)
//
//        input.isClickedCalendarCell
//            .bind(to: output.isShowBottomSheetView)
//            .disposed(by: disposeBag)
//
//        output.date
//            .withUnretained(self)
//            .bind { owner, date in
////                print(date, "로 날짜가 바뀌었습니다.")
//                owner.output.prevCalendarItems.accept(owner.calendarService.getCalendarItems(date: date.plusPeriod(Period.month, interval: -1)))
//                owner.output.nowCalendarItems.accept(owner.calendarService.getCalendarItems(date: date))
//                owner.output.nextCalendarItems.accept(owner.calendarService.getCalendarItems(date: date.plusPeriod(Period.month, interval: 1)))
//            }
//            .disposed(by: disposeBag)
//
//        Observable.combineLatest(output.date, output.nowCalendarItems)
//            .withUnretained(self)
//            .bind { owner, data in
//                let date = data.0
//                let calendarItems = data.1
//                owner.output.bottomSheetCalendarItem.accept(calendarItems.first(where: { $0.date.isEqualPeriod(date: date) }) ?? CalendarItem())
//            }
//            .disposed(by: disposeBag)
//
    }
}
