//
//  DateExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 28/3/24.
//

import UIKit
extension Date{
    
    func addHour(_ hour: Int) -> Date{
        return Calendar.current.date(byAdding: .hour, value: hour, to: self)!
    }
    
    func isLessThan(_ date: Date) -> Bool{
        return self < date
    }
    
    func isLessThanOrEqual(_ date:Date) -> Bool{
        return self <= date
    }
    
    func isGreaterThan(_ date: Date) -> Bool{
        return self > date
    }
    
    func isGreaterThanOrEqual(_ date: Date) -> Bool{
        return self >= date
    }
                    
    func timeAgoDisplayGroupMessage(timeCreate: String)->String{
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 52 * week
        let monthTime = 4 * week
        let year = 12 * month
        let secondAgo = Int(Date().timeIntervalSince(self))
        
        if secondAgo < minute{
            return "Vừa xong"
        }else if secondAgo < hour{
            return "\(secondAgo / minute) phút trước"
        }else if secondAgo < day{
            return "\(secondAgo / hour) giờ trước"
        }else if secondAgo < week{
            return "\(secondAgo / week) ngày trước"
        }else if secondAgo < month{
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "MM-dd-yyyy HH:mm:ss"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd/MM"
            
            let date:NSDate? = dateFormatterGet.date(from: timeCreate) as NSDate?
            return dateFormatterPrint.string(from: date! as Date)
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        let date:NSDate? = dateFormatterGet.date(from: timeCreate) as NSDate?
        
        return dateFormatterPrint.string(from: date! as Date)
    }
                    
    
}
