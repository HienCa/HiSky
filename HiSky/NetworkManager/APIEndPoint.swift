//
//  APIEndPoint.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import Foundation
import UIKit
public class APIEndPoint{
    //ORDER
    private static let version = "v8"
    private static let report_api_version = "v2"
    private static let upload_api_version = "v2"
    private static let version_oauth_service = "v7"
    private static let log_api_version = "v2"
    
    static let REALTIME_SERVER = environmentMode.realTimeUrl
    static let GATEWAY_SERVER_URL = environmentMode.baseUrl
    
    struct NAME{
        static let urlSessions = String(format: "/api/%@/sessions", version_oauth_service)
        
        static let urlConfig = String(format: "api/%@/configs", version_oauth_service)
        
        static let urlRegisterDevice = String(format: "/api/%@/register-device", version_oauth_service)
        
        static let urlCheckVersion = String(format: "/api/%@/check-version", version_oauth_service)
        
        static let urlLogin = String(format: "/api/%@/employees/login", version_oauth_service)
        
        static let urlSetting = String(format: "/api/%@/employees/settings", version_oauth_service)
        
        static let urlGetLastLoginDevice = String(format: "/api/%@/device/last-login", version_oauth_service)
        
    }
    
    struct REPORT{
        static let urlReport = String(format: "/api/%@/report/...", version)
    }
    
    struct SOCKET_GETWAY{
        static let CHAT_DOMAIN = "http://172.16.2.240:9013"
    }
}

extension APIEndPoint{
    private static let version_oauth_aloline = "v8"
    private static let version_timeline_service = "v2"
    
    struct NAME_ALOLINE{
        static let urlSessions = String(format: "/api/%@/sessions", version_oauth_aloline)
        static let urlConfig = String(format: "/api/%@/configs", version_oauth_aloline)
        static let urlLogin = String(format: "/api/%@/customers/login", version_oauth_aloline)
        static let urlRegisterDeviceUDID = String(format: "/api/%@/register-customer-device", version_oauth_aloline)
        static let urlRegister = String(format: "/api/%@/customers/register", version_oauth_aloline)
        static let urlForgotPassword = String(format: "/api/%@/customers/forgot-password", version_oauth_aloline)
        static let urlResetPassword = String(format: "/api/%@/customers/verify-change-password", version_oauth_aloline)
        static let urlVerifyCode = String(format: "/api/%@/customers/verify-code", version_oauth_aloline)
        static let urlUpdateInfo = String(format: "/api/%@/customers/update-profile-register", version_oauth_aloline)
//        static let urlChangePassword = String(format: "/api/%@/customers/%d/change-password", version_oauth_aloline, ManageCacheObject.getCurrentUser().id)
        static let urlRecoveryAccount = String(format: "/api/%@/customers/recovery-account", version_oauth_aloline)
        static let urlCheckVersion = String(format: "/api//check-version", version_oauth_aloline)
        static let urlLoginQR = String(format: "/api/%@/customers/login-by-authenticate-uid", version_oauth_aloline)
        
        static let urlGetNewFeed = String(format: "/api/%@/timeline", version_timeline_service)
        static let urlGetSuggestFriend = String(format: "api/%@/suggest-friend", version_timeline_service)
    }
}
