//
//  ViewController.swift
//  实验九
//
//  Created by Ru Zhao on 2018/11/25.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addLabel(_ sender: Any) {
        //随机生成x y
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        //添加label
        let label = UILabel(frame: CGRect(x: x, y: y, width: 40, height: 40))
        label.text = "wo"
        label.textAlignment = .center
        label.backgroundColor = UIColor.yellow
        //设置label的隐影
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 10, height: 10)
        label.layer.shadowOpacity = 1
        //在viewController中添加手势及相应
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        //设置label为可互动
        label.isUserInteractionEnabled = true
        //在本视图中添加pinch手势
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        label.addGestureRecognizer(pinchRecognizer)
        //添加tap手势
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        //设置单机次数为2
        tapRecognizer.numberOfTapsRequired = 2
        //设置rotate手势
        let rotateRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotate(recognizer:)))
        label.addGestureRecognizer(rotateRecognizer)
        
        rotateRecognizer.delegate = self as? UIGestureRecognizerDelegate
        
        self.view.addSubview(label)
        
        
    }
    //pan方法
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    //pinch方法
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            recognizer.view?.bounds = CGRect(x: 0, y: 0, width: (recognizer.view?.bounds.width)! * recognizer.scale, height: (recognizer.view?.bounds.height)! * recognizer.scale)
            recognizer.scale = 1
        }
    }    //tap方法
    @objc func tap(recognizer: UIPanGestureRecognizer){
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
        
        }
    }
    
    //rotation方法
    @objc func rotate(recognizer: UIRotationGestureRecognizer){
        recognizer.view?.transform = (recognizer.view?.transform.rotated(by: recognizer.rotation))!
        recognizer.rotation = 0
    }
    
//    @objc func rotation(recognizer: UIRotationGestureRecognizer){
//        switch recognizer.state {
//        case .began,.changed:
//            //recognizer.rotation 弧度 pi
//            recognizer.view?.transform = CGAffineTransform(rotationAngle: recognizer.rotation)
//        case .ended:
//            UIView.animate(withDuration: 3, animations: {
//                recognizer.view?.transform = CGAffineTransform(rotationAngle: 0)
//            })
//        default:
//            break
//        }
//    }

    
    //移动按钮方法
    @IBAction func moveLabel(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center = CGPoint(x: x, y: y)
                }
            }
        }
    }
    //删除按钮方法
    @IBAction func deleteLabel(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


