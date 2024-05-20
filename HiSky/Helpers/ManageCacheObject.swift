//
//  ManageCacheObject.swift
//  project
//
//  Created by Nguyen Van Hien on 1/4/24.
//

import UIKit
import ObjectMapper
class ManageCacheObject{
    static func setConfig(_ config: Config){
        UserDefaults.standard.set(Mapper<Config>().toJSON(config), forKey:Constants.KEY_DEFAULT_STORAGE.KEY_CONFIG)
    }
    
    static func getCurrentUser() -> Account{
        if let currentUser = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_ACCOUNT){
            return Mapper<Account>().map(JSONObject: currentUser)!
        }else{
            return Account.init()
        }
    }
    
    static func saveCurrentUser(_ user : Account) {
        UserDefaults.standard.set(Mapper<Account>().toJSON(user), forKey:Constants.KEY_DEFAULT_STORAGE.KEY_ACCOUNT)
        UserDefaults.standard.synchronize()
    }
    
    static func isLogin() -> Bool{
        let user = ManageCacheObject.getCurrentUser()
        if(user.id == 0){
            return false
        }
        return true
    }
    
    static func getConfig() -> Config{
        if let config  = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_CONFIG){
            return Mapper<Config>().map(JSONObject: config)!
        }else{
            return Config.init()!
        }
    }
    static func getPushToken()->String{
        if let push_token : String = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_PUSH_TOKEN) as? String{
            return push_token
        }else{
            return ""
        }
    }
    
    static func setRestaurantName(_ restaurant_name:String){
       UserDefaults.standard.set(restaurant_name, forKey: Constants.KEY_DEFAULT_STORAGE.KEY_RESTAURANT_NAME)
    }
    
    static func getRestaurantName()->String{
        if let restaurant_name  = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_RESTAURANT_NAME){
           return String(restaurant_name as! String)
        }else{
           return ""
        }

    }
    
    static func setAccessToken(_ access_token:String){
        UserDefaults.standard.set(access_token, forKey: Constants.KEY_DEFAULT_STORAGE.KEY_TOKEN)
    }
    
    static func getAccessToken()->String{
        if let access_token : String = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_TOKEN) as? String{
            return access_token
        }else{
            return ""
        }
    }
    
    static func setUsername(_ username:String){
       UserDefaults.standard.set(username, forKey: Constants.KEY_DEFAULT_STORAGE.KEY_PHONE)
    }

    static func getUsername()->String{
        if let username  = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_PHONE){
           
           return String(username as! String)
        }else{
           return ""
        }

    }
    
    // MARK: - Password
    static func setPassword(_ password:String){
        UserDefaults.standard.set(password, forKey:Constants.KEY_DEFAULT_STORAGE.KEY_PASSWORD)
    }

    static func getPassword()->String{
        if let password  = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_PASSWORD){
           return String(password as! String)
        }else{return ""}
    }
    
//    static func saveCurrentBrand(_ brand : Brand) {
//        UserDefaults.standard.set(Mapper<Brand>().toJSON(brand), forKey:Constants.KEY_DEFAULT_STORAGE.KEY_BRAND)
//        
//    }
//    
//    static func getCurrentBrand() -> Brand {
//        if let brand  = UserDefaults.standard.object(forKey: Constants.KEY_DEFAULT_STORAGE.KEY_BRAND){
//            return Mapper<Brand>().map(JSONObject: brand)!
//        }else{
//            return Brand.init()
//        }
//    }
    
}
