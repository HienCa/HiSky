//
//  PathConnectionManager.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit

extension ConnectionManager{
    var baseURL: URL{
        guard let url = URL(string: environmentMode.baseUrl) else {fatalError("ERROR URL")}
        return url
    }
    
    var path: String{
        switch self{
        case .sessions:
            return APIEndPoint.NAME.urlSessions
        
        }
    }
    
}
