//
//  Divider.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import UIKit
class Divider: UIView{
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        contentView = Bundle.main.loadNibNamed("Divider", owner: self, options: nil)?.first as? UIView
        guard let contentView = contentView else {
           fatalError("Unable to load nib file")
        }
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = bounds
        addSubview(contentView)
    }
}
