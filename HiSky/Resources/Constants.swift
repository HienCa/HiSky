//
//  Constants.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import UIKit
struct Constants{
    static let apiKey = "net.techres.order.api"
    static let apiKeyAloline = "net.aloline.vn"
    
    static let OS_NAME = "iOS"
    
    struct METHOD_TYPE{
        static let POST = 1
        static let GET = 0
    }
    
    struct URL{
        static let GETWAY_SERVER_URL = ""
        static let CHAT_DOMAIN = ""
        static let REALTIME_SERVER_URL = ""
        static let UPLOAD_DOMAIN = ""
    }
    
    struct KEY_DEFAULT_STORAGE{
        static let KEY_ACCOUNT = "KEY_ACCOUNT"
        static let KEY_PHONE = "KEY_PHONE"
        static let KEY_PASSWORD = "KEY_PASSWORD"
        static let KEY_CURRENT_POINT = "KEY_CURRENT_POINT"
        static let KEY_ACCOUNT_ID = "KEY_ACCOUNT_ID"
        static let KEY_TOKEN = "KEY_TOKEN"
        static let KEY_PUSH_TOKEN = "KEY_PUSH_TOKEN"
        static let KEY_CONFIG = "KEY_CONFIG"
        static let KEY_SETTING = "KEY_SETTING"
        static let KEY_LOCATION = "KEY_LOCATION"
        static let KEY_TAB_INDEX = "KEY_TAB_INDEX"
        static let KEY_RESTAURANT_NAME = "KEY_RESTAURANT_NAME"
        static let KEY_BRAND = "KEY_BRAND"
    }
    
    struct PAYMENT_METHOD{
        static let CASH = 1
        static let TRANSFER = 2 //chuyển khoản
        static let ATM_CARD = 3 // sử dụng thẻ
    }
    
    struct FORM_REQUIRED{
        struct LOGIN{
            static let PHONE_MIN_LENGTH = 10
            static let PASSWORD_MIN_LENGTH = 4
            static let USERNAME_MIN_LENGTH = 4
            static let RESTAURANT_NAME_MIN_LENGTH = 4
            static let ACCOUNT_MIN_LENGTH = 6
            
            static let PHONE_MAX_LENGTH = 11
            static let PASSWORD_MAX_LENGTH = 50
            static let USERNAME_MAX_LENGTH = 20
            static let RESTAURANT_NAME_MAX_LENGTH = 20
            static let ACCOUNT_MAX_LENGTH = 20
            
            static let PASSWORD_WEAK_LENGTH = 6
            static let PASSWORD_MEDIUM_LENGTH = 10
            static let PASSWORD_STRONG_LENGTH = 12
        }
    }
    
    struct PROJECT_IDS {
        static let PROJECT_OAUTH = 8003 // oauth java api
        static let PROJECT_ALOLINE = 1485 // aloline java api
        static let PROJECT_JAVA = 8002 // java profile service
        static let PROJECT_HEALTH_CHECK = 1408 // java profile service
        // define project id for service node
        static let PROJECT_FRIEND_SERVICE = 9002
        static let PROJECT_STORY_SERVICE = 9003
        static let PROJECT_SHORT_VIDEO_SERVICE = 9004
        static let PROJECT_USER_SERVICE = 9005
        static let PROJECT_SHORT_SERVICE = 9006
        static let PROJECT_UPLOAD_SERVICE = 9007
        static let PROJECT_POST_SERVICE = 9008
        static let PROJECT_TIMELINE_SERVICE = 9009
        static let PROJECT_COMMENT_SERVICE = 9010
        static let PROJECT_REACTION_SERVICE = 9011
        static let PROJECT_STICKER_SERVICE = 9012
        static let PROJECT_CONNECTION_SERVICE = 9013
        static let PROJECT_CONVERSATION_SERVICE = 9014
        static let PROJECT_MESSAGE_SERVICE = 9015
        static let PROJECT_FANPAGE_SERVICE = 9016
        static let PROJECT_REPORT_SERVICE = 9017
        static let PROJECT_NOTIFICATIONS_SERVICE = 9018
        static let PROJECT_VOTE_SERVICE = 9021
        
        static let PROJECT_ID_SEEMT = 8093
        static let PROJECT_ELASTIC = 9030
    }
    
    struct NAVIGATIONS{
        static let NAV_NEWFEED = 0
        static let NAV_WATCH = 1
        static let NAV_FRIEND_REQUEST = 2
        static let NAV_SHOP = 3
        static let NAV_NOTIFICATION = 4
        static let NAV_SETTING = 5
    }
    static let NAV_OBJECT = [
        NavigationBarModel(imageNameDefault: "house", imageNameSelected: "house.fill", tag: NAVIGATIONS.NAV_NEWFEED),
        NavigationBarModel(imageNameDefault: "video", imageNameSelected: "video.fill", tag: NAVIGATIONS.NAV_WATCH),
        NavigationBarModel(imageNameDefault: "person.badge", imageNameSelected: "person.fill.bage", tag: NAVIGATIONS.NAV_FRIEND_REQUEST),
        NavigationBarModel(imageNameDefault: "storefront", imageNameSelected: "storefront.fill", tag: NAVIGATIONS.NAV_SHOP),
        NavigationBarModel(imageNameDefault: "bell.badge", imageNameSelected: "bell.badge.fill", tag: NAVIGATIONS.NAV_NOTIFICATION),
        NavigationBarModel(imageNameDefault: "sidebar.right", imageNameSelected: "sidebar.right", tag: NAVIGATIONS.NAV_SETTING),
    ]
}

