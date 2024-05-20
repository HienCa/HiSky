//
//  UITextFieldExtension.swift
//  project
//
//  Created by Nguyen Van Hien on 5/4/24.
//

import UIKit


extension UITextField {
    //tự gọi phương thức trong hàm override này
    open override func awakeFromNib() {
            super.awakeFromNib()
            addDoneButtonOnKeyboard()// mặc định sẽ có nút done trên tất cả UITextField
    }
    
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    class TextField: UITextField {
        
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
        
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
        
        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    }
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
   
}
extension UITextField{
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Xong", style: .done, target: self, action: #selector(self.doneButtonAction))
       
        let items = [flexSpace,done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }
    
 
    @objc func doneButtonAction(){
        self.resignFirstResponder()
    }
    
//    func setBorderAndCorner(){
//        DispatchQueue.main.async {
//            self.layer.borderWidth = 1.0
//            self.layer.borderColor = ExFunction.hexStringToUIColor(hex: "61906B").cgColor
//            self.layer.cornerRadius = 5
//        }
//    }
    
    func setLeftPaddingPointsTextField(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    

    
    func setRightPaddingPointsTextField(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text ?? "")
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self.text ?? "", options: [], range: NSMakeRange(0, (self.text ?? "").count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == (self.text ?? "").count && (self.text ?? "").count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func addToolBar(toolBarHeight: CGFloat = 40){
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: toolBarHeight))
        
        let flexiableSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneAction = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEditing))
        
        let items = [flexiableSpace, doneAction]
        toolBar.setItems(items, animated: true)
        inputAccessoryView = toolBar
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func addRightButton(button : UIButton) {
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        self.rightView = button
        self.rightViewMode = .always
    }
    func addRightButtonHideOrShowPassword() {
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.setImage(UIImage(named: "unhide"), for: .normal)
        button.setImage(UIImage(named: "hide"), for: .selected)
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @objc func onClick(sender : UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
    
    func addImageLeft(img: UIImage, color: UIColor) {
        let image = UIImageView()
      
        image.frame = CGRect(x: 10, y: 15, width: 20, height: 20)
        image.image = img
        image.tintColor = color
        self.addSubview(image)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
