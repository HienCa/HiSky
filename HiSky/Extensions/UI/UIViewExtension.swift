//
//  UIViewExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 1/4/24.
//

import UIKit
enum RoundType {
    case top
    case bottom
    case left
    case right
    case northeast
    case southwest
    case topRight
    case topLeft
    case bottomRight
    case bottomLeft
    case both
    case none
}
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {

            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}

extension UIView {
    func setupCornerRadius(_ cornerRadius: CGFloat = 0, maskedCorners: CACornerMask? = nil) {
        layer.cornerRadius = cornerRadius
        if let corners = maskedCorners {
            layer.maskedCorners = corners
        }
    }
    
    func animateClick(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.15) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform.identity
            } completion: { _ in completion() }
        }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 7
        layer.backgroundColor = ColorUtils.whiteBackGroundColor().cgColor
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
           self.layer.maskedCorners = corners
           self.layer.cornerRadius = radius
           self.layer.borderWidth = borderWidth
           self.layer.borderColor = borderColor.cgColor

       }
    
    
    func addBorder(toEdges edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        func addBorder(toEdge edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            
            switch edges {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            default:
                break
            }
            
            layer.addSublayer(border)
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(toEdge: .top, color: color, thickness: thickness)
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(toEdge: .bottom, color: color, thickness: thickness)
        }
        
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(toEdge: .left, color: color, thickness: thickness)
        }
        
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(toEdge: .right, color: color, thickness: thickness)
        }
    }
    
    func addBorder(color: UIColor = ColorUtils.orange_brand_900(), margins: CGFloat = 1, borderLineSize: CGFloat = 1) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .height,
                                                multiplier: 1, constant: borderLineSize))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1, constant: margins))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1, constant: margins))
    }
    
    func addBottomBorder(color: UIColor = ColorUtils.blueButton(), margins: CGFloat = 1, borderLineSize: CGFloat = 1) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        border.addConstraint(NSLayoutConstraint(item: border,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .height,
                                                multiplier: 1, constant: borderLineSize))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .bottom,
                                              multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1, constant: margins))
        self.addConstraint(NSLayoutConstraint(item: border,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1, constant: margins))
    }
    
    
    
    func round(with type: RoundType, radius: CGFloat = 3.0) {
        var corners: CACornerMask
        switch type {
            case .northeast:
                corners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
            case .southwest:
                corners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
            case .top:
                corners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            case .bottom:
                corners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .left:
                corners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            case .right:
                corners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            case .bottomLeft:
                corners = .layerMinXMaxYCorner
            case .bottomRight:
                corners = .layerMaxXMaxYCorner
            case .topRight:
                corners = .layerMaxXMinYCorner
            case .topLeft:
                corners = .layerMinXMinYCorner
            case .both:
                corners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .none:
                corners = []
            }
        DispatchQueue.main.async {
           self.layer.maskedCorners = corners
           self.layer.cornerRadius = radius
           self.layer.masksToBounds = true
       }
    }
    
    @discardableResult
    func setGradietColor(colorOne: UIColor, colorTwo: UIColor)  {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,0.1]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
      
   }
    
    enum RoundCornersAt{
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
        //multiple corners using CACornerMask
    func roundCorners(corners:[RoundCornersAt], radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [
            corners.contains(.topRight) ? .layerMaxXMinYCorner:.init(),
            corners.contains(.topLeft) ? .layerMinXMinYCorner:.init(),
            corners.contains(.bottomRight) ? .layerMaxXMaxYCorner:.init(),
            corners.contains(.bottomLeft) ? .layerMinXMaxYCorner:.init(),
        ]
    }
    
    func removeAllSubViews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    
}
