//
//  UIAlertControllerExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 10/4/24.
//

import Foundation
import UIKit
enum RRSortEnum: Int {
    case asc
    case desc

    var title: String? {
        switch self {
        case .asc:
            return "Ascending"
        case .desc:
            return "Descending"
        }
    }
}
extension UIAlertController{
    
    class private func getAlertController(title : String, message : String?) -> UIAlertController {
        
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let titleFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor: ColorUtils.black()]
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium), NSAttributedString.Key.foregroundColor: ColorUtils.black()]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont as [NSAttributedString.Key : Any])
        let messageAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageFont as [NSAttributedString.Key : Any])

        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(messageAttrString, forKey: "attributedMessage")
        
        return alertController
    }
    
    class func showAlert(title : String?, message : String?, handler: ((UIAlertController) -> Void)? = nil){
        let alertController = getAlertController(title: title ?? "", message: message)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            handler?(alertController)
        }))
        //appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    class func showBottomSheet(title : String?, message : String?, handler: ((RRSortEnum) -> Void)? = nil) {
        let alertController = getAlertController(title: title ?? "", message: message)
        alertController.addAction(UIAlertAction.init(title: RRSortEnum.asc.title, style: .default, handler: { (action) in
            handler?(.asc)
        }))
        alertController.addAction(UIAlertAction.init(title: RRSortEnum.desc.title, style: .default, handler: { (action) in
            handler?(.desc)
        }))
        alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
}

