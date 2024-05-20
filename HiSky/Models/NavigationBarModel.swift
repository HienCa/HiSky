//
//  NavigationBarModel.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import Foundation
struct NavigationBarModel{
    let imageNameDefault: String
    let imageNameSelected: String
    let tag: Int
    
    init(imageNameDefault: String, imageNameSelected: String, tag: Int) {
        self.imageNameDefault = imageNameDefault
        self.imageNameSelected = imageNameSelected
        self.tag = tag
    }
}
