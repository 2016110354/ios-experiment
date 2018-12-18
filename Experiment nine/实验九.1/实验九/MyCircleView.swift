//
//  MyCircleView.swift
//  实验九
//
//  Created by Ru Zhao on 2018/11/25.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class MyCircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var myColor: UIColor?
    
    //构造函数中方法
    func setup() {
//        //设置阴影
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: -5, height: -5)
//        self.layer.shadowOpacity = 0.5
//        self.contentMode = .redraw

        //设置手势
        //设置拖动实例
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        //视图中添加pan手势
        self.addGestureRecognizer(panRecognizer)
        //设置缩放实例
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        //视图中添加pinch手势
        self.addGestureRecognizer(pinchRecognizer)
        //设置删除tap手势
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        //视图中添加tap
        self.addGestureRecognizer(tapRecognizer)
        //设置为双击
        tapRecognizer.numberOfTapsRequired = 2
        //增加rotation旋转手势
        let rotateGuesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(recognizer:)))
        self.addGestureRecognizer(rotateGuesture)
        //rotateGuesture.delegate = ViewController
    }
    //pan方法
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            //拖动的距离以及拖动后位置
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            //重置拖动距离为0
            recognizer.setTranslation(.zero, in: self)
        }
    }
    //pinch方法
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            bounds = CGRect(x: 0, y: 0, width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
            
        }
    }
    //tap方法
    @objc func tap(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .ended:
            self.removeFromSuperview()
        default:
            break
        }
    }

    //rotation方法
    @objc func rotate(recognizer: UIRotationGestureRecognizer) {
        let rotation = recognizer.rotation
        //因为rotated返回的是CGAffineTransform
        self.transform = self.transform.rotated(by: rotation)
        recognizer.rotation = 0
    }
//    @objc func rotation(recognizer: UIRotationGestureRecognizer){
//        switch recognizer.state {
//        case .began,.changed:
//    //recognizer.rotation 弧度 pi
//            self.transform = CGAffineTransform(rotationAngle: recognizer.rotation)
//        case .ended:
//                UIView.animate(withDuration: 3, animations: {
//            self.transform = CGAffineTransform(rotationAngle: 0)
//                })
//        default:
//            break
//  }
//}

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
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


