//
//  MethodConnectionManager.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit
import Moya

extension ConnectionManager{
    var method: Moya.Method {
        switch self{
        case .sessions:
            return .get
        
        }
    }
}
