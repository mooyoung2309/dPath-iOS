//
//  Date.swift
//  CMC_Hackathon_App
//
//  Created by do_yun on 2022/01/29.
//

import Foundation

fileprivate let dateFormatter : DateFormatter = {
    let f = DateFormatter()
    f.locale = Locale(identifier: "ko_kr")
    return f
}()

extension Date{
    var dayString: String {
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    var dateString : String{
        dateFormatter.dateFormat = "YYYY.M"
        return dateFormatter.string(from: self)
    }
    var timeString : String{
        dateFormatter.dateFormat = "a HH:mm"
        return dateFormatter.string(from: self)
    }
    var dateTimeString : String{
        dateFormatter.dateFormat = "d일 a HH시"
        return dateFormatter.string(from: self)
    }
    
    func getDatesOfMonth() -> [Date] {
        var dates: [Date] = []
        var date: Date = Date()
        var dc = self.getKstDateComponents()
        
        dc.day = 1
        dc.hour = 12
        date = dc.date!
        while date.getKstDateComponents().weekday! != 1 {
            date = date.plusPeriod(Period.day, interval: -1)
            dates.append(date)
        }
        
        dates = dates.reversed()
        dc.day = 1
        date = dc.date!
        while date.getKstDateComponents().month == dc.month || date.getKstDateComponents().weekday != 1{
            dates.append(date)
            date = date.plusPeriod(Period.day, interval: 1)
        }
        return dates
    }
    
    func plusPeriod(_ period: Period = Period.day, interval: Int) -> Date {
        if period == Period.day {
            return Calendar.current.date(byAdding: .day, value: interval, to: self)!
        } else if period == Period.week {
            return Calendar.current.date(byAdding: .weekOfYear, value: interval, to: self)!
        } else if period == Period.month {
            return Calendar.current.date(byAdding: .month, value: interval, to: self)!
        } else if period == Period.year {
            return Calendar.current.date(byAdding: .year, value: interval, to: self)!
        } else {
            return Date()
        }
    }
    
    func getKstDateComponents() -> DateComponents {
        return Calendar.current.dateComponents(in: TimeZone(abbreviation: "KST")!, from: self)
    }
}
