//
//  RoundCornerView.swift
//  BFMyDay
//
//  Created by panbc on 16/6/30.
//  Copyright © 2016年 panbc. All rights reserved.
//

import UIKit

@IBDesignable
class RoundCornerView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat
    
    override init(frame: CGRect){
        cornerRadius = 1.0
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        cornerRadius = 1.0
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = backgroundColor!.CGColor
    }
    
}
