//
//  MyCircle.swift
//  实验4.2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class MyCircle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var myColor: UIColor?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func draw(_ rect: CGRect) {
        //画圆
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setStroke()
        path.stroke()
        myColor = UIColor.blue
        myColor!.setFill()
        path.fill()
    }

}
