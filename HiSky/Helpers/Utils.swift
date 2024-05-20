//
//  Utils.swift
//  RemoteNotification
//
//  Created by Nguyen Van Hien on 28/3/24.
//

import UIKit
class Utils:NSObject{
    static func encoded(str: String)->String{
        
        if let base64Str = str.base64Encoded() {
            print("Base64 encoded string: \"\(base64Str)\"")
            return base64Str
        }
        return str
    }
    static func getUDID()-> String{
        let UDID = UIDevice.current.identifierForVendor!.uuidString
        
        return UDID.lowercased()
    }
    static func getOSName()-> String{
        return  "iOS"
    }
    static func getPlatFormType()-> String{
        return  ""
    }

    static func getPlatType()-> Int{
        return  1
    }
    static func getAppType()-> Int{
        return  11
    }
    static func getAppTypeAloLine()-> Int{
        return  1
    }
    static func getPlatFormTypeAloLine()-> Int{
        return  2
    }
    static func convertDayMonthYearFormat(_ inputDateTime: String) -> String?{
        let inputFormat = "yyyy-MM-dd HH:mm:ss"
        let outputFormat = "dd/MM/YYYY"
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: inputDateTime){
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
                
        }else{
            return nil
        }
    }
    
    static func timeAgo(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "vi_VN")
        inputFormatter.timeZone = TimeZone(identifier: "UTC")
        
        if let date = inputFormatter.date(from: dateString) {
            let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: Date())
            
            if let year = components.year, year > 1 {
                return "\(year) năm trước"
            } else if let month = components.month, month > 0 {
                return "\(month) tháng trước"
            } else if let day = components.day, day > 0 {
                if day > 7 {
                    return "\(day / 7) tuần trước"
                } else {
                    return "\(day) ngày trước"
                }
            } else if let hour = components.hour, hour > 0 {
                return "\(hour) giờ trước"
            } else if let minute = components.minute, minute > 0 {
                return "\(minute) phút trước"
            } else if let second = components.second, second > 0 {
                return "\(second) giây trước"
            } else {
                return "Vừa xong"
            }
        } else {
            return "" // Handle invalid dateString here
        }
    }

    static func formatTimestamp(_ timestamp: String) -> String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: timestamp){
            let currentDate = Date().addingTimeInterval(7 * 60 * 60)
            let timeDifference = currentDate.timeIntervalSince(date)
            
            if timeDifference < 10{
                return "Vừa truy cập"
            }else if timeDifference < 3600{
                let minutesAgo = Int(timeDifference / 60)
                return "Hoạt động \(minutesAgo) phút trước"
            }else if timeDifference < 86400{
                let hoursAgo = Int(timeDifference / 3600)
                return "Hoạt động \(hoursAgo) giờ trước"
            }else{
                return ""
            }
        }else{
            return ""
        }
    }
    
    static func makeAttributedString (text: String, fontSize: CGFloat, isBool:Bool, textColor:UIColor) -> NSAttributedString{
        var attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor: textColor]
        
        if let font = UIFont(name: "Roboto", size: fontSize){
            attributes[.font] = isBool ? UIFont.boldSystemFont(ofSize: fontSize) : font
        }
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        return attributedText
    }
    
    static func changTextToColors(fullText: String, textToColors: [(str: String, attributes: [NSAttributedString.Key: Any])]) -> NSAttributedString{
        let fullTextNeedChange = NSMutableAttributedString(string: fullText)
        
        for (text, attributes) in textToColors{
            let range = (fullText as NSString).range(of: text)
            
            for attribute in attributes {
                fullTextNeedChange.addAttribute(attribute.key, value: attribute.value, range: range)
            }
        }
        return fullTextNeedChange
    }
    
//    static func getFullMediaLink(string:String, media_type: Int = TYPE_IMAGE) -> String {
//        dLog( media_type == TYPE_VIDEO ? (String(format: "LINK_VIDEO:%@%@", APIEndPoint.GATEWAY_SERVER_URL, "/s3") + string).encodeUrl()! : (String(format: "LINK_IMAGE:%@", ManageCacheObject.getConfig().api_upload_short) + string).encodeUrl()!)
//        
//        return media_type == TYPE_VIDEO ? (String(format: "%@%@", APIEndPoint.GATEWAY_SERVER_URL, "/s3") + string).encodeUrl()! : (String(format: "%@", ManageCacheObject.getConfig().api_upload_short) + string).encodeUrl()!
//        
//    }
    
    
}
