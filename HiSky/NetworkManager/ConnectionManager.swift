//
//  ConnectionManager.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit
import Alamofire
import Moya
import Foundation
import RxSwift

enum ConnectionManager:TargetType{
    case sessions
}



let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .requestBody)
let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
let networkActivity = NetworkActivityPlugin(networkActivityClosure: {(activity, target) in
    switch activity{
        case .began:
            print("began")
            DispatchQueue.main.async {
                if let visibleViewCtrl = UIApplication.shared.keyWindow?.rootViewController {
                    // do whatever you want with your `visibleViewCtrl`
//                    if target.path != APIEndPoint.Name.urlGetPrintItem{
                        JHProgressHUD.sharedHUD.showInView(visibleViewCtrl.view)
//                    }
                    
                }
            }

        case .ended:
            print("end")
            DispatchQueue.main.async {
                if let visibleViewCtrl = UIApplication.shared.keyWindow?.rootViewController {
                    // do whatever you want with your `visibleViewCtrl`
                    JHProgressHUD.sharedHUD.hide()
                }
            }
        }
    }
)

let endpointClosure = {
    (target: ConnectionManager) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    return defaultEndpoint.adding(newHTTPHeaderFields: ["Content-Type": "application/json"])
}

let appServiceProvider = MoyaProvider<ConnectionManager>(endpointClosure: endpointClosure, session: DefaultAlamofireSession.shared, plugins: [networkLogger, networkActivity])

class DefaultAlamofireSession: Alamofire.Session{
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireSession(configuration: configuration)
    }()
}
