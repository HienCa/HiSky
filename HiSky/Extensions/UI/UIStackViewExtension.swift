//
//  UIStackViewExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 1/4/24.
//

import UIKit
extension UIStackView{
    func addArrangeSubViews(_ subviews: [UIView]){
        subviews.forEach{addArrangedSubview($0)}
    }
}
