//
//  NavigationBar.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import UIKit
class NavigationBar: UIView{
    var contentView: UIView!
    var currentPage: Int = 0
    var didSelectCompletion: (Int) -> Void = {_ in}
    @IBOutlet var navigationItems: [UIButton]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        
        contentView = Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)?.first as? UIView
        guard let contentView = contentView else {
           fatalError("Unable to load nib file")
        }
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = bounds
        addSubview(contentView)
        setupNavigation()
        changeButtonsBackground(button: navigationItems[0])
    }
    
    private func changeButtonsBackground(button: UIButton){
        self.navigationItems.forEach{
            button in
            button.backgroundColor = ColorUtils.backgroundColor()
            button.tintColor = ColorUtils.grey()
            if let imageName = button.imageView?.image?.accessibilityIdentifier {
                print("Image name: \(imageName)")
            }
        }
        button.backgroundColor = ColorUtils.nav_background_active()
        button.tintColor = ColorUtils.orange()
        if let imageName = button.imageView?.image?.accessibilityIdentifier {
            print("Image name: \(imageName)")
        }
    }
    
    public func didSelect(completion: @escaping (_ tag: Int) -> Void){
        didSelectCompletion = completion
    }
    
    private func setupNavigation(){
        navigationItems.forEach({
            button in
            button.addTarget(self, action: #selector(onTouched(_:)), for: .touchUpInside)
        })
    }
    
    @objc func onTouched(_ sender: UIButton){
        didSelectCompletion(sender.tag)
        changeButtonsBackground(button: sender)
    }
    
//    private func changeButtonImage(button: UIButton){
//        if button.tag == Constants.NAVIGATIONS.
//    }
}

