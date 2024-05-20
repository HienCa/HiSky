//
//  TaskConnectionManager.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit
import Moya
import Alamofire
extension ConnectionManager{
    private func encoding(_ httpMethod: HTTPMethod) -> ParameterEncoding{
        var encoding: ParameterEncoding = JSONEncoding.prettyPrinted
        if httpMethod == .get{
            encoding = URLEncoding.default
        }
        return encoding
    }
    
    var task: Task{
        dLog(headers)
        switch self{
        case .sessions:
            return .requestParameters(parameters: ["device_uid": Utils.getUDID()], encoding: self.encoding(.get))
            
    
        }
    }
}

