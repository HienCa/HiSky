//
//  Enviroments.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import UIKit
import Moya
var environmentMode = EnviromentMode.production
enum EnviromentMode{
    case develop
    case staging
    case production
    
    var value: Int{
        switch self{
        case .develop:
            return 0
        case .staging:
            return 1
        case .production:
            return 2
        }
    }
    
    var baseUrl: String{
        switch self {
            case .develop:
                return "https://beta.api.gateway.overate-vntech.com"
            case .staging:
                return "https://staging.api.gateway.overate-vntech.com"
            case .production:
                return "https://api.gateway.overate-vntech.com"
        }
    }
    
    var realTimeUrl: String {
        switch self {
            case .develop:
                return "https://beta.realtime.order.techres.vn"
            case .staging:
                return "http://172.16.10.144:1483"
            case .production:
                return "https://realtime.order.techres.vn"
        }
    }
    
    var PROJECT_OAUTH: Int {
        switch self {
            case .develop:
                return 8003
            case .staging:
                return 8003
            case .production:
                return 8003
        }
    }
    var PROJECT_ID_ORDER: Int {
        switch self {
            case .develop:
                return 8005
            case .staging:
                return 8005
            case .production:
                return 8005
          
        }
    }
    var PROJECT_ID_ORDER_SMALL: Int {
        switch self {
            case .develop:
                return 8004
            case .staging:
                return 8004
            case .production:
                return 8004
          
        }
    }

}

enum ProjectID:Int {
    case PROJECT_ID_ORDER
    case PROJECT_ID_ORDER_SMALL
    case PROJECT_OAUTH

    var value: Int{
        switch self {
            case .PROJECT_OAUTH:
                return environmentMode.PROJECT_OAUTH
            case .PROJECT_ID_ORDER:
                return environmentMode.PROJECT_ID_ORDER
            case .PROJECT_ID_ORDER_SMALL:
                return environmentMode.PROJECT_ID_ORDER_SMALL
        }
    }
}

enum Method:Int {
    case GET
    case POST
    case PUT
    
    var value:Int{
        switch self {
            case .GET:
                return 0
            
            case .POST:
                return 1
          
            case .PUT:
                return 1
          
        }
    }
}

