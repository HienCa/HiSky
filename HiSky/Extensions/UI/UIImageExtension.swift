//
//  UIImageExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 5/4/24.
//

import UIKit
import Kingfisher

extension UIImage {
    
    var toBase64String:String {
        let imageData = self.pngData()
        return imageData!.base64EncodedString(options: .lineLength64Characters)
    }
    
    var halfSizeImage: UIImage? {
        
       let halfWidth = self.size.width / 2
       let halfHeight = self.size.height / 2
        
        UIGraphicsBeginImageContext(CGSize(width: halfWidth, height: halfHeight))
        
        self.draw(in: CGRect(x: 0, y: 0, width: halfWidth, height: halfHeight))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    // Return Quarter- Size version of Current image
    var quarterhalfSizeImage:UIImage? {
        
        let halfWidth = self.size.width / 4
        let halfHeight = self.size.height / 4
        
        UIGraphicsBeginImageContext(CGSize(width: halfWidth, height: halfHeight))
        
        self.draw(in: CGRect(x: 0, y: 0, width: halfWidth, height: halfHeight))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    //Loading Image From Document Directory
    func loadImageFromDocumentDirPath(_ path: String) -> UIImage? {
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        if (data != nil){
            let image = UIImage(data: data!)
            return image
        }else{
            return nil
        }
    }
    
    func resize() -> Data? {
           
           let maxHeight: CGFloat = 1136
           let maxWidth: CGFloat = 640
           
           var actualHeight = self.size.height
           var actualWidth = self.size.width

           var imgRatio = actualWidth / actualHeight
           let maxRatio = maxWidth / maxHeight
           var compressionQuality : CGFloat = 0.5
           
           if actualHeight > maxHeight || actualWidth > maxWidth {
               if imgRatio < maxRatio {
                   //adjust width according to maxHeight
                   imgRatio = maxHeight / actualHeight
                   actualWidth = imgRatio * actualWidth
                   actualHeight = maxHeight
               }
               else if imgRatio > maxRatio {
                   //adjust height according to maxWidth
                   imgRatio = maxWidth / actualWidth
                   actualHeight = imgRatio * actualHeight
                   actualWidth = maxWidth
               }
               else {
                   actualHeight = maxHeight
                   actualWidth = maxWidth
                   compressionQuality = 1
               }
           }
           
           let canvas = CGSize(width: actualWidth, height: actualHeight)
           let format = imageRendererFormat
           format.opaque = true
           let result = UIGraphicsImageRenderer(size: canvas, format: format).image {
               _ in draw(in: CGRect(origin: .zero, size: canvas))
           }
           return result.jpegData(compressionQuality: compressionQuality)
       }
}

extension UIImageView {
    
    func setKingfisherImageView(image: String?, placeholder: String = "") {
        var path = ""
        if let url = image {
            path = url
        }
                
        if placeholder.isEmpty {
            self.kf.indicatorType = .activity
            let indicator = self.kf.indicator?.view as? UIActivityIndicatorView
            //indicator?.style = .whiteLarge
            indicator?.color = ColorUtils.orange_brand_900()
        }
        
        self.kf.setImage(
            with: URL(string: path),
            placeholder: UIImage(named: placeholder),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
