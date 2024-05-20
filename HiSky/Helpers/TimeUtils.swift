//
//  TimeUtils.swift
//  RemoteNotification
//
//  Created by Nguyen Van Hien on 27/3/24.
//

import UIKit
class TimeUtils:NSObject{
    static var calendar:Calendar{
        get{
            var calendar = Calendar(identifier: .gregorian)
            calendar.timeZone = TimeZone(identifier: "Asia/Ho_Chi_Minh")!
            return calendar
        }
    }
        
    //get day, month, year
    static func getCurrentDateTime() -> (
        thisWeek:String,
        thisMonth:String,
        lastMonth:String,
        threeLastMonth:String,
        thisYear:String,
        lastYear:String,
        threeLastYear: String,
        today:String,
        yesterday:String,
        currentTime:String,
        currentHour:Int){
        
        //Tao doi tuong calendar theo muooi gio cua VN
        let calendar = calendar
        
        //Lay ngay hien tai
        let date = Date()
        let year = calendar.component(.year, from: date)
        
        //lay so tuan hien tai
        let currentWeek = calendar.component(.weekOfYear, from: date)
        let thisWeek = String(format: "%02d/%d", currentWeek, year)
        
        //thang nay
        let tm = Calendar.current.date(byAdding: .month, value: 0, to: Date())
        let tmFormatter: DateFormatter = DateFormatter()
        tmFormatter.dateFormat = "MM/yyyy"
        let thisMonth = tmFormatter.string(from: tm!)
        
        //thang truoc
        let lm = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let lmFormatter:DateFormatter = DateFormatter()
        lmFormatter.dateFormat = "MM/yyyy"
        let lastMonth = lmFormatter.string(from: lm!)
        
        //3 thang truoc
        let tlm = Calendar.current.date(byAdding: .month, value: -3, to: Date())
        let tlmFormatter = DateFormatter()
        tlmFormatter.dateFormat = "MM/yyyy"
        let threeLastMonth = tlmFormatter.string(from: tlm!)
        
        //nam nay
        let thisYear = String(year)
        
        //nam truoc
        let ly = Calendar.current.date(byAdding: .year, value: -1, to: Date())
        let lyFormatter = DateFormatter()
        lyFormatter.dateFormat = "yyyy"
        let lastYear = lyFormatter.string(from: ly!)
        
        //3 nam truoc
        let tly = Calendar.current.date(byAdding: .year, value: -3, to: Date())
        let tlyFormatter = DateFormatter()
        tlyFormatter.dateFormat = "yyyy"
        let threeLastYear = tlyFormatter.string(from: tly!)
        
        //hom nay
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let today = formatter.string(from: date)
        
        //gio hom nay
        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm:ss"
        let currentTime = formatterTime.string(from: date)
        
        //hom qua
        let ld = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let ldFormatter = DateFormatter()
        ldFormatter.dateFormat = "dd/MM/yyyy"
        let yesterday = ldFormatter.string(from: ld!)
        
        let currentHour =  calendar.component(.hour, from: date)

        return (thisWeek, thisMonth, lastMonth, threeLastMonth, thisYear, lastYear, threeLastYear, today, yesterday, currentTime, currentHour)
    }
    
    static func convertToDateFormatForService(dateStr:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Ho_Chi_Minh")
        
        let date = dateFormatter.date(from: dateStr)
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.string(from: date ?? Date())
    }
    
    static func convertMinuteHourMinuteFormat(_ timeValue:Int) -> String {
        let timeMeasure = Measurement(value: Double(timeValue), unit: UnitDuration.minutes)
        let hours = timeMeasure.converted(to: .hours)
        if hours.value > 0{
            let minutes = timeMeasure.value.truncatingRemainder(dividingBy: 60)
            return String(format: "%02.f:02.f", floor(hours.value), minutes)
            
        }
        return String(format: "00:%02.f", timeMeasure.value)
    }
    
    static func calculateTime(_ timeValue:Int) ->String{
        let timeMeasure = Measurement(value: Double(timeValue), unit: UnitDuration.minutes)
        let hours = timeMeasure.converted(to: .hours)
        if hours.value > 1{
            let minutes = timeMeasure.value.truncatingRemainder(dividingBy: 60)
            return String(format: "%02.f:%02f", floor(hours.value), minutes)
            
        }
        return String(format: "00:%02.f", timeMeasure.value)
        
    }
    
    static func getFullCurrentDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "MM"
        let monthString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "dd"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "HH:mm"
        let hour_string = dateFormatter.string(from: date)
        
        return String(format: "%@/%@/%@ %@", dayOfTheWeekString, monthString, yearString, hour_string)
    }
    
    static func getCurrentDatePass()-> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddMMyy"
        return dateFormatter.string(from: currentDate)
        
    }
    static func isDateValid(fromDate: String, toDate: String) -> Bool{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let fromDate = dateFormatter.date(from: fromDate) ?? Date()
        let toDate = dateFormatter.date(from: toDate) ?? Date()
        return fromDate.isLessThan(toDate)
    }
    
    static func convertToVNDateFormatString(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let formatedDate = formatter.string(from: date)
        return formatedDate
    }
    
    static func convertToVNDateTimeFormatString(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd/MM/yyyy"
        let formatedDate = formatter.string(from: date)
        return formatedDate
    }
    
    static func convertToDateTimeFormatString(datetimeString: String, inputFormat: String, outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        if let formattedDate = dateFormatter.date(from: datetimeString) {
            dateFormatter.dateFormat = outputFormat
            let formattedString = dateFormatter.string(from: formattedDate)
            return formattedString
        } else {
            return ""
        }
    }
    
    
    static func getCurrentTime() -> (hour:Int, minute: Int, second:Int){
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return (hour, minute, second)
    }
    static func convertTimeDayOfWeek(timeReminder:String)-> String{
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        inputFormatter.locale = Locale(identifier: "vi_VN")
        inputFormatter.timeZone =  TimeZone(identifier: "UTC")
        var outputString = ""
        
        if let date = inputFormatter.date(from: timeReminder){
            let calendar = Calendar(identifier: .gregorian)
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            
            if calendar.isDateInToday(date){
                outputString = "Hôm nay lúc " + outputFormatter.string(from: date)
            }else{
                let dayName = calendar.component(.weekday, from: date)
                let dayAbbMap = [2: "Thứ 2", 3: "Thứ 3", 4: "Thứ 4", 5:"Thứ 5", 6:"Thứ 6", 7:"Thứ 7", 1: "Chủ nhật"]
                
                let dayAbbr = dayAbbMap[dayName] ?? ""
                let dayReminder = calendar.component(.day, from: date)
                let monthReminder = calendar.component(.month, from: date)
                let yearReminder = calendar.component(.year, from: date)
                                                       
                let currentYear = calendar.component(.year, from: Date())
                
                                                       let formattedDate = outputFormatter.string(from: date)
                outputString = "\(dayAbbr), \(dayReminder) tháng \(monthReminder)"
                                                       
                                                       if currentYear == yearReminder{
                    outputString += " lúc " + formattedDate
                }else{
                    outputString += ", \(calendar.component(.year, from: date)) lúc " + formattedDate
                }
                                               
            }
        }
        return ""
    }
    
    
    
    
    
}


