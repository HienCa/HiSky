//
//  HeaderConnectionParameter.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit
extension ConnectionManager{
    
    func headerJava(ProjectId:ProjectID = .PROJECT_OAUTH, Method: Method = .GET) -> [String : String]{

        var projectId:ProjectID = .PROJECT_ID_ORDER_SMALL
        
        if(ProjectId == .PROJECT_ID_ORDER){
//            projectId = Constants.GPBH_1 ? .PROJECT_ID_ORDER_SMALL : .PROJECT_ID_ORDER
        }else{
            projectId = ProjectId
        }
        
        if ManageCacheObject.isLogin(){
            return ["Authorization": String(format: "Bearer %@", ManageCacheObject.getCurrentUser().access_token), "ProjectId": String(format: "%d", projectId.value), "Method": String(format: "%d", Method.value)]
        }else{
            if ManageCacheObject.getConfig().api_key != nil{
                return ["Authorization": String(format: "Basic %@", ManageCacheObject.getConfig().api_key),
                        "ProjectId": String(format: "%d", projectId.value), "Method": String(format: "%d", Method.value)]
            }else{
                return ["ProjectId": String(format: "%d", projectId.value), "Method": String(format: "%d", Method.value)]
            }

        }
    }
    
    func headerAloLine(ProjectId:Int = Constants.PROJECT_IDS.PROJECT_ALOLINE, Method:Method = .GET) -> [String : String]{
        if  ManageCacheObject.isLogin(){
            return ["Authorization": String(format: "Bearer %@", ManageCacheObject.getCurrentUser().access_token), "ProjectId":String(format: "%d", ProjectId), "Method":String(format: "%d", Method.value)]
        }else if ManageCacheObject.getConfig().api_domain != nil{
            return ["Authorization": String(format: "Basic %@", ManageCacheObject.getConfig().api_key),"ProjectId":String(format: "%d", ProjectId), "Method":String(format: "%d", Method.value)]
            
        }else{
            return ["ProjectId": String(format: "%d", ProjectId), "Method": String(format: "%d", Method.value)]
        }
    }
    func headerAloLineNode(ProjectId:Int = Constants.PROJECT_IDS.PROJECT_ALOLINE, Method:Method = .GET) -> [String : String]{
        if  ManageCacheObject.isLogin(){
            return ["Authorization": String(format: "Bearer %@", ManageCacheObject.getCurrentUser().access_token), "ProjectId":String(format: "%d", ProjectId), "Method":String(format: "%d", Method.value)]
        }else{
            if(ManageCacheObject.getConfig().api_domain != nil){
                return ["Authorization": String(format: "%@ ", ManageCacheObject.getConfig().api_key), "ProjectId":String(format: "%d", ProjectId), "Method":String(format: "%d", Method.value)]
            }else{
                return ["ProjectId":String(format: "%d", ProjectId), "Method":String(format: "%d", Method.value)]
            }
        }
    }
    
    var headers: [String: String]?{
        switch self{
        case .sessions:
            return headerJava(ProjectId: .PROJECT_OAUTH, Method: .GET)
        
        }
        
    }
}
