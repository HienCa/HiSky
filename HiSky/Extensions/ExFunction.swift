//
//  ExFunction.swift
//  project
//
//  Created by Nguyen Van Hien on 5/4/24.
//

import UIKit


public struct ExFunction {
    
    //MARK:- String to Dictionary Conversion
    static func convertStringToDictionary(_ json: String) -> [String: Any] {
        if let data = json.data(using: String.Encoding.utf8) {
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: Any]
                return json ?? [:]
            }catch{
                print(error)
            }
        }
        return [:]
    }
    
    static func getRawJSON(from dictionary:[String: Any]) -> String{
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {
            //Handle Error here
            return ""
        }
        let jsonString = String(data: theJSONData, encoding: .ascii) ?? ""
        return jsonString
    }
    
    static func hexStringToUIColor(hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
