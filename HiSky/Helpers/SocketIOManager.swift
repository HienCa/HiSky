//
//  SocketIOManager.swift
//  project
//
//  Created by Nguyen Van Hien on 4/4/24.
//

import UIKit
import SocketIO
import ObjectMapper

class SocketIOManager: NSObject {
    //singleton
    private static var shareSocketRealtime: SocketIOManager = {
        let socketManager = SocketIOManager()
        return socketManager
    }()
    
    class func shared() -> SocketIOManager {
           return shareSocketRealtime
    }
    
    
    var managerRealTime: SocketManager?
    
    var socketRealTime:SocketIOClient?
    
    private var managerRealTimeOfLogin:SocketManager?

    var socketRealTimeOfLogin:SocketIOClient?
    
    
    override init() {
        super.init()
        
//        if let url = URL(string: ManageCacheObject.isLogin() ? ManageCacheObject.getConfig().realtime_domain : APIEndPoint.REALTIME_SERVER) {
//            
//            let auth = ["token": String(format: "Bearer %@", ManageCacheObject.getCurrentUser().access_token)]
////               dLog(auth)
//            self.managerRealTime = SocketManager(socketURL: url, config: [.log(false), .compress, .reconnects(true), .extraHeaders(auth)])
//            
//            let namespace = "/"
//           
//                
//            self.socketRealTime =  self.managerRealTime!.socket(forNamespace: namespace)
//            self.managerRealTime?.connectSocket(self.socketRealTime!, withPayload: auth)
//            
//            self.socketRealTime?.connect()
//            
//        }
        
    }
    
    
    func initSocketInstanceOfLogin() {
//        if let url = URL(string: ManageCacheObject.isLogin() ? ManageCacheObject.getConfig().socket_conect_login : "https://realtime.oauth.techres.vn") {
//            let auth = ["token": ManageCacheObject.getCurrentUser().jwt_token]
//            self.managerRealTimeOfLogin = SocketManager(socketURL: url, config: [.log(false), .compress, .reconnects(true), .extraHeaders(auth)])
//            self.socketRealTimeOfLogin = self.managerRealTimeOfLogin!.socket(forNamespace: "/")
//            self.managerRealTimeOfLogin?.connectSocket(self.socketRealTimeOfLogin!, withPayload: auth)
//            self.socketRealTimeOfLogin?.connect()
//        }
    }
    
    
    func initSocketInstance(_ namespace: String) {
//        if let url = URL(string: ManageCacheObject.isLogin() ? ManageCacheObject.getConfig().realtime_domain : APIEndPoint.REALTIME_SERVER) {
//            let auth = ["token": String(format: "Bearer %@", ManageCacheObject.getCurrentUser().access_token)]
//            let cofig:SocketIOClientConfiguration = [
//                .log(true),
//                .compress,
//                .reconnects(true),
//                .extraHeaders(auth),
//                .forceWebsockets(true),
//            ]
//            
//            self.managerRealTime = SocketManager(socketURL: url, config: cofig)
////            let namespace = "/"
//            self.socketRealTime =  self.managerRealTime!.socket(forNamespace: namespace)
//            self.managerRealTime?.connectSocket(self.socketRealTime!, withPayload: auth)
//            self.socketRealTime?.connect()
//        }
        
    }
    
    func establishConnection() {
      
        socketRealTime?.on("connect") {data, ack in
            dLog("connected==============: \(data.description)")
        }
        self.socketRealTime?.connect()

    }
    
    func closeConnection() {
        self.socketRealTime!.disconnect()
        socketRealTime?.on("disconnect") {data, ack in
            dLog("disconnect: \(data.description)")
            
        }
    }
    

 
}


class SocketChatIOManager: NSObject {
    static let sharedInstance = SocketChatIOManager()
    
//    let manager = SocketManager(socketURL: URL(string:ManageCacheObject.isLogin() ? ManageCacheObject.getConfig().realtime_domain : APIEndPoint.REALTIME_SERVER)!, config: [.log(false), .compress])
//   
    var  socket:SocketIOClient?
    
    override init() {
        super.init()
//        self.socket = manager.defaultSocket
        
    }
    
    func establishConnection() {
        self.socket?.connect()
    }
    

    func closeConnection() {
        self.socket!.disconnect()
    }

 
}


